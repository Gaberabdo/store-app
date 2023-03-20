import 'package:shop/component/component.dart';
import 'package:shop/model/favorites_model.dart';

import '../api.dart';

class PostFavorites {
  Future<FavoritesModel> postFavorites({
    required int productId,

  }) async {
    Map<String, dynamic> data = await Api().post(
      url: FAVORITES,
      body: {
        'productId': productId,
      },
      token: token,

    );

    return FavoritesModel.fromJson(data);
  }
}
