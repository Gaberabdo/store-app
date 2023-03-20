class SearchModel {
  SearchModel({
    required this.status,
    this.message,
    required this.data,
  });
  late final bool status;
  late final Null message;
  late final Data data;

  SearchModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = null;
    data = Data.fromJson(json['data']);
  }


}

class Data {
  Data({
    required this.currentPage,
    required this.product,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final List<Product> product;
  late final String firstPageUrl;
  late final int from;
  late final int lastPage;
  late final String lastPageUrl;
  late final Null nextPageUrl;
  late final String path;
  late final int perPage;
  late final Null prevPageUrl;
  late final int to;
  late final int total;

  Data.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    product = List.from(json['Product']).map((e)=>Product.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = null;
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = null;
    to = json['to'];
    total = json['total'];
  }


}

class Product {
  Product({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });
  late final int id;
  late final double? price;
  late final String image;
  late final String name;
  late final String description;
  late final List<String> images;
  late final bool inFavorites;
  late final bool inCart;

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = List.castFrom<dynamic, String>(json['images']);
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['price'] = price;
    _data['image'] = image;
    _data['name'] = name;
    _data['description'] = description;
    _data['images'] = images;
    _data['in_favorites'] = inFavorites;
    _data['in_cart'] = inCart;
    return _data;
  }
}