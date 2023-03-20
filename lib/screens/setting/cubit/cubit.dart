import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/helper/service/post_login.dart';
import 'package:shop/helper/service/post_register.dart';
import 'package:shop/model/login_model.dart';
import 'package:shop/model/register_model.dart';

import 'package:shop/screens/login/cubit/states.dart';
import 'package:shop/screens/setting/cubit/states.dart';

import '../../../helper/service/get_profile.dart';
import '../../../model/profile_model.dart';


class SettingCubit extends Cubit<ProfileHomePage> {
  SettingCubit() : super(InitialProfileHomePageStates());
  static SettingCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel ;
  void getProfile() async{
    emit(LoadingProfileHomePageStates());
    try{
      profileModel = await GetProfile().getProfile();
      emit(SuccessProfileHomePageStates());
    } on Exception catch (error){
      print(error);
      emit(ErrorProfileHomePageStates());
    }
  }



}
