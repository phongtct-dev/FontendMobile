import 'package:flutter/material.dart';

class WarrantyPolicyPage extends StatelessWidget {
  const WarrantyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Chính sách bảo hành", style: TextStyle(fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection(theme, "Thông tin chung", Icons.info_outline, [
              "Tên shop: ECOSHOP",
              "Áp dụng cho sản phẩm: Mọi mặt hàng từ shop",
            ]),
            _buildSection(theme, "1. Thời gian bảo hành", Icons.access_time, [
              "Thời gian bảo hành: 3 giờ",
              "Tính từ: Lúc nhận hàng",
            ]),
            _buildSection(theme, "2. Điều kiện được bảo hành", Icons.check_circle_outline, [
              "Sản phẩm bị lỗi do nhà cung cấp",
              "Sản phẩm còn trong thời gian bảo hành",
              "Có hóa đơn / đơn hàng",
              "Sản phẩm không bị thất thoát quá 80%",
            ]),
            _buildSection(theme, "3. Trường hợp KHÔNG bảo hành", Icons.cancel_outlined, [
              "Rơi vỡ, va đập",
              "Sử dụng sai cách",
              "Hết thời gian bảo hành",
            ], isError: true),
            _buildSection(theme, "4. Chính sách đổi trả", Icons.autorenew, [
              "Có hỗ trợ đổi trả: 1 đổi 1",
              "Thời gian đổi trả: 3 giờ",
            ]),
            _buildSection(theme, "5. Quy trình bảo hành", Icons.support_agent, [
              "B1. Khách hàng liên hệ qua Phần thông tin liên hệ Shop",
              "B2. Shop sẽ gửi nhân viên đến lấy sản phẩm",
              "B3. Thời gian xử lý: Không quá 6 giờ",
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(ThemeData theme, String title, IconData icon, List<String> items, {bool isError = false}) {
    return Card(
      elevation: 0,
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: isError ? Colors.red.withOpacity(0.3) : theme.colorScheme.outline.withOpacity(0.1)),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: isError ? Colors.red : theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isError ? Colors.red : null)),
              ],
            ),
            const Divider(height: 24),
            ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• ", style: TextStyle(color: isError ? Colors.red : theme.colorScheme.primary, fontSize: 18, fontWeight: FontWeight.bold)),
                  Expanded(child: Text(item, style: const TextStyle(height: 1.4))),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}