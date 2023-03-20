import 'package:shop/component/component.dart';
import 'package:shop/model/categories_model.dart';

import '../api.dart';

class GetCategorise {
  Future<CategoriesModel> getCategorise() async {
    Map<String, dynamic> data = await Api().get(
      url: GET_CATEGORIES,
      token: token,


    );

    return CategoriesModel.fromJson(data);
  }
}
