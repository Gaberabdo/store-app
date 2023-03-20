import '../../../model/login_model.dart';
import '../../../model/register_model.dart';


abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final LoginModel loginModel;

  SuccessLoginState(this.loginModel);
}

class ErrorLoginState extends LoginState {}

class LoadingRegisterState extends LoginState {}

class SuccessRegisterState extends LoginState {
  final RegisterModel registerModel;

  SuccessRegisterState(this.registerModel);
}

class ErrorRegisterState extends LoginState {

  final String error;

  ErrorRegisterState(this.error);
}

class ShopChangePasswordVisibilityState extends LoginState {}
