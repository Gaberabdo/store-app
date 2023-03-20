class CategoriesModel {
  final dynamic status;
  final CategoriesDataModel? data;
  CategoriesModel({required this.status, required this.data});

  factory CategoriesModel.fromJson(jsonData) {
    return CategoriesModel(
        status: jsonData['status'],
        data: jsonData['data'] == null
            ? null
            : CategoriesDataModel.fromJson(jsonData['data']));
  }
}

class CategoriesDataModel {
  CategoriesDataModel({required this.currentPage, required this.data});
  final int currentPage;
  final DataModel? data;

  factory CategoriesDataModel.fromJson(jsonData) {
    return CategoriesDataModel(
        currentPage: jsonData['currentPage'],
        data: jsonData['data'] == null
            ? null
            : DataModel.fromJson(jsonData['data']));
  }
}

class DataModel {
  final int id;
  final String name;
  final String image;
  DataModel({required this.id, required this.image, required this.name});

  factory DataModel.fromJson(jsonData) {
    return DataModel(
      id: jsonData['id'],
      name: jsonData['name'],
      image: jsonData['image'],
    );
  }
}
