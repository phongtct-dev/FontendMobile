import 'package:flutter/material.dart';

class ContactShopPage extends StatelessWidget {
  const ContactShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Liên hệ Shop", style: TextStyle(fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.storefront, size: 64, color: theme.colorScheme.primary),
                  const SizedBox(height: 8),
                  const Text("ECOSHOP", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _buildContactCard(theme, "Thông tin cơ bản", Icons.info_outline, [
              "Hotline: 0909909099",
              "Email: Ecoshop@gmail.com",
            ]),
            _buildContactCard(theme, "Địa chỉ", Icons.location_on_outlined, [
              "Xã Lợi Thuận, huyện Bến Cầu, tỉnh Tây Ninh, Việt Nam",
            ]),
            _buildContactCard(theme, "Giờ làm việc", Icons.access_time, [
              "Thứ 2 - Thứ 6: 05:30 - 22:30",
              "Thứ 7: 06:30 - 22:30",
              "Chủ nhật: 08:30 - 22:30",
            ]),
            _buildContactCard(theme, "Kênh liên hệ khác", Icons.connect_without_contact, [
              "Zalo: (Sắp ra mắt)",
              "Facebook: (Sắp ra mắt)",
            ]),

            const SizedBox(height: 24),
            // HÀNH ĐỘNG NHANH
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {}, // Đang làm UI tĩnh
                    icon: const Icon(Icons.call),
                    label: const Text("Gọi ngay"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {}, // Đang làm UI tĩnh
                    icon: const Icon(Icons.map),
                    label: const Text("Xem bản đồ"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(ThemeData theme, String title, IconData icon, List<String> items) {
    return Card(
      elevation: 0,
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: theme.colorScheme.outline.withOpacity(0.1))),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((e) => Padding(padding: const EdgeInsets.only(top: 4), child: Text(e))).toList(),
        ),
      ),
    );
  }
}