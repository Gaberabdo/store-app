import 'package:shop/component/component.dart';
import 'package:shop/model/login_model.dart';

import '../api.dart';

class GetLogin {
  Future<LoginModel> getLogin({
    required String password,
    required String email,

  }) async {
    Map<String, dynamic> data = await Api().post(
      url: LOGIN,
      body: {
        'password': password,
        'email': email,
      },
      token: '',

    );

    return LoginModel.fromJson(data);
  }
}
