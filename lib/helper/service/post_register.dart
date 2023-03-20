import 'package:shop/component/component.dart';
import 'package:shop/model/login_model.dart';
import 'package:shop/model/register_model.dart';

import '../api.dart';

class PostRegister {
  Future<RegisterModel> postRegister({
    required String name,
    required String phone,
    required String password,
    required String email,

  }) async {
    Map<String, dynamic> data = await Api().post(
      url: REGISTER,
      body: {
        'password': password,
        'email': email,
        'phone': phone,
        'name': name,
      }, token: '',
    );

    return RegisterModel.fromJson(data);
  }
}
