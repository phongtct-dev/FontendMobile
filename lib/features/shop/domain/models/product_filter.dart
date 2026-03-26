class ProductFilter {
  String? keyword;
  String? categoryId;
  String? brand;
  double? minPrice;
  double? maxPrice;
  double? rating;
  bool? isOnSale;
  bool? inStock;
  String? sort;
  int page;

  ProductFilter({
    this.keyword, this.categoryId, this.brand,
    this.minPrice, this.maxPrice, this.rating,
    this.isOnSale, this.inStock, this.sort = '-createdAt',
    this.page = 1,

  });

  // Chuyển đối tượng thành Query Parameters cho Dio
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> params = {};

    if (keyword != null && keyword!.isNotEmpty) params['keyword'] = keyword;
    if (categoryId != null) params['category'] = categoryId;
    if (brand != null) params['brand'] = brand;

    // Chỉ gửi nếu người dùng có kéo slider (không gửi 0 và 2tr mặc định)
    if (minPrice != null && minPrice! > 0) params['price[gte]'] = minPrice!.toInt();
    if (maxPrice != null && maxPrice! < 2000000) params['price[lte]'] = maxPrice!.toInt();

    // FIX LỖI SAO: Gửi số nguyên và ĐÚNG TÊN FIELD backend cần
    if (rating != null) {
      params['ratingsAverage[gte]'] = rating!.toInt();
    }

    // FIX LỖI GIẢM GIÁ: Chỉ gửi khi tích chọn, và gửi dạng STRING
    if (isOnSale == true) {
      params['isPromotion'] = 'true';
    }

    // FIX LỖI CÒN HÀNG: Gửi đúng định dạng stock[gt]=0
    if (inStock == true) {
      params['stock[gt]'] = '0'; // Gửi string '0' cho chắc chắn
    }

    params['page'] = page;
    if (sort != null) params['sort'] = sort;

    return params;
  }
}