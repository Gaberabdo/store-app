class HomeModelPage {
  final bool? status;
  final HomeDataModel? data;
  HomeModelPage({required this.status, required this.data});

  factory HomeModelPage.fromJson(jsonData) {
    return HomeModelPage(
        status: jsonData['status'],
        data: jsonData['data'] == null ? null : HomeDataModel.fromJson(jsonData['data'])
    );
  }
}

class HomeDataModel {
  final BannerModel? banners;
  final ProductModel? products;
  HomeDataModel({required this.banners, required this.products});
  factory HomeDataModel.fromJson(jsonData) {
    return HomeDataModel(
      banners: jsonData['banners'] == null
          ? null
          : BannerModel.fromJson(jsonData['data']),
      products: jsonData['products'] == null
          ? null
          : ProductModel.fromJson(jsonData['data']),
    );
  }
}

class BannerModel {
  int? id;
  String? image;

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final bool? inFavorites;
  final bool? inCart;

  ProductModel(
      {required this.id,
      required this.name,
      required this.inFavorites,
      required this.price,
      required this.description,
      required this.image,
      required this.oldPrice,
      required this.discount,
      required this.inCart});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      name: jsonData['name'],
      inFavorites: jsonData['inFavorites'],
      price: jsonData['price'],
      description: jsonData['description'],
      image: jsonData['image'],
      discount: jsonData['discount'],
      inCart: jsonData['inCart'],
      oldPrice: jsonData['oldPrice'],
    );
  }
}
