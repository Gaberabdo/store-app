import 'package:shop/component/component.dart';
import 'package:shop/model/favorites_model.dart';
import 'package:shop/model/product_model.dart';

import '../api.dart';

class GetFavorites {
  Future<FavoritesModel> getFavorites() async {
    Map<String, dynamic> data = await Api().get(
      url: FAVORITES,


    );
    return FavoritesModel.fromJson(data.cast());
  }
}