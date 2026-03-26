import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/cart_repository_impl.dart'; // Import đúng Repo mới
import '../../domain/models/cart_model.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  FutureOr<CartResponse?> build() async {
    return _fetchCart();
  }

  Future<CartResponse> _fetchCart() async {
    return ref.read(cartRepositoryProvider).getCart();
  }

  // Cập nhật số lượng (Optimistic - Không hiển thị Loading xoay xoay giữa màn hình)
  Future<void> updateQty(String productId, int quantity) async {
    // Không set state = AsyncLoading để tránh hiện màn hình trắng loading
    final result = await AsyncValue.guard(() =>
        ref.read(cartRepositoryProvider).updateCartQuantity(productId, quantity)
    );
    state = result;
  }

  Future<void> deleteItem(String productId) async {
    // Tương tự cho delete
    final result = await AsyncValue.guard(() =>
        ref.read(cartRepositoryProvider).removeFromCart(productId)
    );
    state = result;
  }

  // Thêm vào giỏ thì vẫn cần Loading vì nó thường ở trang khác chuyển sang
  Future<void> addItem(String productId, int quantity) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() =>
        ref.read(cartRepositoryProvider).addToCart(productId, quantity)
    );
  }
}