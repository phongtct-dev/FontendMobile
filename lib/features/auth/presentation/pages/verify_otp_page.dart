import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/navigation/app_router.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../providers/verify_otp_provider.dart';
import '../providers/register_provider.dart';

class VerifyOtpPage extends ConsumerStatefulWidget {
  final String email; // Nhận email từ trang Register truyền sang
  const VerifyOtpPage({super.key, required this.email});

  @override
  ConsumerState<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends ConsumerState<VerifyOtpPage> {
  final _codeController = TextEditingController();

  void _onVerify() async {
    final code = _codeController.text.trim();
    if (code.length < 4) return; // Giả sử mã OTP của bạn từ 4-6 số

    final success = await ref.read(verifyOtpStateProvider.notifier).verify(widget.email, code);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Xác thực thành công! Hãy đăng nhập."), backgroundColor: Colors.green),
      );
      context.go(AppRoutes.login); // Xác thực xong cho về Login
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(verifyOtpStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Xác thực tài khoản")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Icon(Icons.mark_email_read_outlined, size: 80, color: Color(0xFF1877D2)),
            const SizedBox(height: 24),
            Text(
              "Mã xác thực đã được gửi đến:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              widget.email,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 32),

            // Ô nhập mã OTP
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, letterSpacing: 8, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: "000000",
                border: OutlineInputBorder(),
                helperText: "Nhập mã OTP gồm 6 chữ số từ Email",
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: state.isLoading ? null : _onVerify,
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1877D2)),
                child: state.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("XÁC NHẬN", style: TextStyle(color: Colors.white)),
              ),
            ),

            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Gọi API gửi lại mã OTP (send-verification-code)
                ref.read(authRepositoryProvider).sendVerificationCode(widget.email);
              },
              child: const Text("Gửi lại mã OTP"),
            ),
          ],
        ),
      ),
    );
  }
}