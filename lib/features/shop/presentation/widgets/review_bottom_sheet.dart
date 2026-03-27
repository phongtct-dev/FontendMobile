import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../home/data/repositories/home_repository_impl.dart';

class ReviewBottomSheet extends ConsumerStatefulWidget {
  final String productId;
  final String productName;

  const ReviewBottomSheet({
    super.key,
    required this.productId,
    required this.productName,
  });

  @override
  ConsumerState<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends ConsumerState<ReviewBottomSheet> {
  int _rating = 5; // Mặc định 5 sao
  final _reviewController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitReview() async {
    if (_reviewController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng nhập nội dung đánh giá"), backgroundColor: Colors.orange),
      );
      return;
    }

    setState(() => _isLoading = true);
    FocusScope.of(context).unfocus(); // Đóng bàn phím

    try {
      final repo = ref.read(homeRepositoryProvider);
      await repo.createReview(widget.productId, _rating, _reviewController.text.trim());

      if (mounted) {
        Navigator.pop(context,true); // Đóng BottomSheet
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Đánh giá thành công! Cảm ơn bạn."), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().replaceAll("Exception: ", "")), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      // Padding bottom giúp bảng trượt dâng lên khi bàn phím xuất hiện
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20, right: 20, top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Thanh kéo
          Container(
            width: 40, height: 5,
            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(height: 16),
          const Text("Đánh giá sản phẩm", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(widget.productName, style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w500), textAlign: TextAlign.center, maxLines: 2),
          const SizedBox(height: 20),

          // 5 NGÔI SAO CHỌN ĐƯỢC
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                onPressed: () => setState(() => _rating = index + 1),
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 40,
                ),
              );
            }),
          ),
          Text(
            _rating == 5 ? "Tuyệt vời" : _rating == 4 ? "Rất tốt" : _rating == 3 ? "Bình thường" : _rating == 2 ? "Tệ" : "Rất tệ",
            style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Ô NHẬP TEXT
          TextField(
            controller: _reviewController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Hãy chia sẻ cảm nhận của bạn về sản phẩm này nhé...",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: theme.colorScheme.surfaceVariant.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 24),

          // NÚT GỬI
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: _isLoading ? null : _submitReview,
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Gửi đánh giá", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}