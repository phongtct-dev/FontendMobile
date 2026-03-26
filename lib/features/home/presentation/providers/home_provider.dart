import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../product/domain/entities/product.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/entities/home_data.dart';



part 'home_provider.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  FutureOr<HomeStateData> build() async {
    final repo = ref.watch(homeRepositoryProvider);

    // Gọi 4 API song song để tối ưu tốc độ
    final results = await Future.wait([
      repo.fetchCategories(),
      repo.fetchHomeProducts(queryParameters: {'isPromotion': 'true'}, limit: 10), // 1. Giá sốc
      repo.fetchHomeProducts(sort: '-sold', limit: 10),                            // 2. Bán chạy
      repo.fetchHomeProducts(sort: '-createdAt', limit: 10),                       // 3. Mới nhất
    ]);

    return HomeStateData(
      banners: _hardcodedBanners,
      categories: results[0] as List<CategoryEntity>,
      flashSales: results[1] as List<ProductEntity>,
      bestSellers: results[2] as List<ProductEntity>,
      newArrivals: results[3] as List<ProductEntity>,
    );
  }

  // Đưa dữ liệu banner hardcode  vào đây
  final List<BannerEntity> _hardcodedBanners = [
    const BannerEntity(
        id: 1,
        title: "Vườn rau sạch mỗi ngày",
        subtitle: "Tươi ngon từ nông trại",
        image: "https://images.unsplash.com/photo-1461354464878-ad92f492a5a0?auto=format&fit=crop&w=1600&q=80",
        link: "",
        type: "vegetable"
    ),
    const BannerEntity(
        id: 2,
        title: "Trái cây tươi ngon tự nhiên",
        subtitle: "Ngọt lành từ vườn cây ăn quả",
        image: "https://images.unsplash.com/photo-1471193945509-9ad0617afabf?auto=format&fit=crop&w=1600&q=80",
        link: "",
        type: "fruit"
    ),
    const BannerEntity(
        id: 3,
        title: "Hương vị từ biển cả",
        subtitle: "Nguồn thực phẩm sạch từ đại dương",
        image: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1600&q=80",
        link: "",
        type: "ocean"
    ),

    // Thêm các banner khác  vào đây...
  ];
}