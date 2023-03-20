import 'package:shop/component/component.dart';
import 'package:shop/model/product_model.dart';

import '../api.dart';

class GetProduct {
  Future<HomeModelPage> getProduct() async {
    Map<String, dynamic> data = await Api().get(
      token: token,
      url: HOME,

    );
    return HomeModelPage.fromJson(data);
  }
}

class GetProductDetails {
  Future<ProductModel> getProductDetails({required int productId }) async {
    Map<String, dynamic> data = await Api().get(
      token: token,
      url: '$PRODUCT/$productId' ,


    );
    print(data.toString());
    return ProductModel.fromJson(data);
  }
}
