import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/navigation/app_router.dart';
import '../../domain/models/cart_model.dart';
import '../../domain/models/order_model.dart'; // Import Model mới
import '../providers/cart_provider.dart';
import '../../../profile/presentation/providers/profile_provider.dart';
import '../../data/repositories/cart_repository_impl.dart'; // Nơi chứa orderRepositoryProvider

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  final _voucherController = TextEditingController();
  String selectedPayment = "COD";
  double voucherDiscount = 0;
  bool isApplyingVoucher = false;

  Future<void> _handleApplyVoucher() async {
    // 1. Nếu chưa nhập gì mà bấm -> báo lỗi nhẹ
    if (_voucherController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng nhập mã giảm giá!"), backgroundColor: Colors.orange),
      );
      return;
    }

    // 2. Ẩn bàn phím đi cho gọn màn hình
    FocusScope.of(context).unfocus();

    setState(() => isApplyingVoucher = true);

    try {
      final result = await ref.read(cartRepositoryProvider).checkVoucher(_voucherController.text.trim());

      setState(() {
        voucherDiscount = (result['discountAmount'] as num).toDouble();
      });

      // 3. THÔNG BÁO THÀNH CÔNG (Màu xanh lá)
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Text("Áp dụng mã thành công! Giảm ${NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(voucherDiscount)}"),
              ],
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating, // Nổi lên cho đẹp
          ),
        );
      }
    } on DioException catch (e) {
      // 4. BẮT LỖI TỪ BACKEND ĐỂ HIỆN RA CHỮ (Ví dụ: "Bạn đã sử dụng mã này rồi")
      String errorMessage = "Lỗi kết nối máy chủ";
      if (e.response != null && e.response?.data != null) {
        final responseData = e.response?.data;
        if (responseData is Map) {
          String rawError = responseData['stack']?.toString() ?? responseData['message']?.toString() ?? "Mã không hợp lệ";
          errorMessage = rawError.replaceAll("Error: ", "").split("\n")[0];
        }
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Lỗi: $e"), backgroundColor: Colors.red));
    } finally {
      setState(() => isApplyingVoucher = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartNotifierProvider).value;
    final profile = ref.watch(profileNotifierProvider).value;
    final colorScheme = Theme.of(context).colorScheme;

    if (cart == null || profile == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(title: const Text("Xác nhận thanh toán")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection(
              title: "Địa chỉ nhận hàng",
              icon: Icons.location_on,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(profile.fullName ?? "Chưa có tên"),
                subtitle: Text("${profile.phone ?? ''}\n${profile.address ?? ''}"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                onTap: () => context.push(AppRoutes.updateProfile),
              ),
            ),
            const SizedBox(height: 16),
            _buildSection(
              title: "Mã giảm giá",
              icon: Icons.confirmation_number,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _voucherController,
                      decoration: const InputDecoration(hintText: "Nhập mã voucher..."),
                    ),
                  ),
                  isApplyingVoucher
                      ? const CircularProgressIndicator()
                      : TextButton(onPressed: _handleApplyVoucher, child: const Text("ÁP DỤNG")),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSection(
              title: "Phương thức thanh toán",
              icon: Icons.payment,
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text("Thanh toán khi nhận hàng (COD)"),
                    value: "COD",
                    groupValue: selectedPayment,
                    onChanged: (val) => setState(() => selectedPayment = val!),
                  ),
                  RadioListTile(
                    title: const Text("Thanh toán Online (Stripe)"),
                    value: "ONLINE",
                    groupValue: selectedPayment,
                    onChanged: (val) => setState(() => selectedPayment = val!),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildPriceBreakdown(cart, voucherDiscount),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAction(cart, profile),
    );
  }

  Widget _buildSection({required String title, required IconData icon, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Icon(icon, size: 18), const SizedBox(width: 8), Text(title, style: const TextStyle(fontWeight: FontWeight.bold))]),
          const Divider(),
          child,
        ],
      ),
    );
  }

  Widget _buildPriceBreakdown(CartResponse cart, double discount) {
    final currency = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return _buildSection(
      title: "Chi tiết thanh toán",
      icon: Icons.receipt_long,
      child: Column(
        children: [
          _priceRow("Tạm tính", currency.format(cart.cartStats.totalOriginalPrice)),
          _priceRow("Giảm giá sản phẩm", "-${currency.format(cart.cartStats.totalDiscount)}", color: Colors.green),
          _priceRow("Voucher", "-${currency.format(discount)}", color: Colors.green),
          const Divider(),
          _priceRow("TỔNG THANH TOÁN", currency.format(cart.cartStats.totalFinalPrice - discount), isBold: true, fontSize: 18),
        ],
      ),
    );
  }

  Widget _priceRow(String label, String value, {Color? color, bool isBold = false, double fontSize = 14}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: fontSize)),
          Text(value, style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
        ],
      ),
    );
  }

  Widget _buildBottomAction(CartResponse cart, profile) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 55), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          onPressed: () => _handlePlaceOrder(profile),
          child: const Text("ĐẶT HÀNG NGAY", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Future<void> _handlePlaceOrder(profile) async {
    // 1. Tạo object request
    final request = OrderRequest(
      voucherCode: _voucherController.text.isEmpty ? null : _voucherController.text,
      shippingAddress: ShippingAddress(
        fullName: profile.fullName ?? '',
        phone: profile.phone ?? '',
        address: profile.address ?? '',
      ),
      paymentMethod: selectedPayment,
    );

    try {
      final result = await ref.read(cartRepositoryProvider).createOrder(request);
      if (selectedPayment == "ONLINE" && result['checkoutUrl'] != null) {
        final url = Uri.parse(result['checkoutUrl']);
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        context.go(AppRoutes.orderSuccess);
      }
    } on DioException catch (e) {
      String errorMessage = "Không thể đặt hàng. Vui lòng thử lại.";
      if (e.response != null && e.response?.data != null) {
        final responseData = e.response?.data;
        if (responseData is Map) {
          String rawError = responseData['stack']?.toString() ?? responseData['message']?.toString() ?? "Lỗi xử lý đơn hàng";
          errorMessage = rawError.replaceAll("Error: ", "").split("\n")[0];
        }
      }
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Lỗi: $e"), backgroundColor: Colors.red));
    }
  }
}