import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/order_model.dart';
import '../../data/repositories/order_repository_impl.dart';

part 'orders_provider.g.dart';

@riverpod
class OrdersNotifier extends _$OrdersNotifier {
  int _page = 1;
  bool _hasMore = true;
  String _statusFilter = 'ALL';

  @override
  FutureOr<List<OrderEntity>> build() async {
    _page = 1;
    _hasMore = true;
    return _fetchOrders();
  }

  Future<List<OrderEntity>> _fetchOrders() async {
    final repo = ref.read(orderRepositoryProvider);
    final response = await repo.getMyOrders(
      page: _page,
      limit: 10, // Mỗi lần load 10 đơn
      status: _statusFilter == 'ALL' ? null : _statusFilter,
    );

    // Nếu server trả về ít hơn 10 đơn nghĩa là đã hết dữ liệu
    if (response.orders.length < 10) {
      _hasMore = false;
    }

    return response.orders;
  }

  //
  Future<void> loadMore() async {
    if (state.isLoading || state.isReloading || !_hasMore) return;

    final currentList = state.valueOrNull ?? [];
    _page++;

    try {
      final newOrders = await _fetchOrders();
      state = AsyncData([...currentList, ...newOrders]);
    } catch (e, st) {
      _page--;
      state = AsyncData(currentList);
    }
  }

  // Hàm gọi khi bấm vào nút lọc trạng thái
  void changeStatus(String status) {
    if (_statusFilter == status) return;
    _statusFilter = status;
    ref.invalidateSelf(); // Reset lại toàn bộ để load từ page 1
  }

  bool get hasMore => _hasMore;
  String get currentStatus => _statusFilter;
}