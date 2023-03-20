import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/component/component.dart';
import 'package:shop/helper/service/post_login.dart';
import 'package:shop/helper/service/post_register.dart';
import 'package:shop/model/login_model.dart';
import 'package:shop/model/register_model.dart';

import 'package:shop/screens/login/cubit/states.dart';


class ShopLoginCubit extends Cubit<LoginState> {
  ShopLoginCubit() : super(LoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);

  LoginModel? modelLogin;

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());
    try {
      modelLogin = await GetLogin().getLogin(
        password: password,
        email: email,

      );
      token = modelLogin!.data!.token;
      print('dsfasgafgdfsgsdfgdfgsdffgdfgf${token.toString()}');
      emit(SuccessLoginState(modelLogin!));
    } on Exception catch (error) {
      print(error.toString());
      emit(ErrorLoginState());
    }
  }

  RegisterModel? modelRegister;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(LoadingRegisterState());
    try {
      modelRegister = await PostRegister().postRegister(
        name: name,
        password: password,
        email: email,
        phone: phone,
      );
      emit(SuccessRegisterState(modelRegister!));
    } on Exception catch (error) {
      print('fdssssssssssssssssssssssss${error.toString()}');
      emit(ErrorRegisterState(error.toString()));
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}
