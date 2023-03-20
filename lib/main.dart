// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/screens/favorites_screen.dart';


import 'package:shop/screens/home_page/cubit/home_cubit.dart';
import 'package:shop/screens/home_page/cubit/home_states.dart';
import 'package:shop/screens/home_page/home_screen.dart';
import 'package:shop/screens/login/cubit/cubit.dart';
import 'package:shop/screens/login/login.dart';
import 'package:shop/screens/onBoarding/onBoarding.dart';
import 'package:shop/screens/product/product_screen.dart';
import 'package:shop/screens/setting/cubit/cubit.dart';

import 'helper/bloc_observe/observe.dart';
import 'helper/local/cache_helper.dart';
import 'helper/service/get_categorise.dart';
import 'model/categories_model.dart';
 Map<int,bool> fav ={} ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  Widget? widget;

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String token = CacheHelper.getDataString(key: 'token').toString();
  print(token);

  if (onBoarding != null) {
    if (token != null) {
      widget = const HomePage();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget startWidget;

  MyApp({super.key, required this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => HomePageCubit(GetCategorise())
            ..getCategories()
            ..getProduct()
            ..getProductDetails()
            ..getFavorites(),
        ),
        BlocProvider(
          create: (context) => ShopLoginCubit(),
        ),
        BlocProvider(
          create: (context) => SettingCubit()..getProfile(),
        ),
      ],
      child: BlocConsumer<HomePageCubit, HomePageStates>(
        builder: (context, state) {
          return MaterialApp(
            theme: buildThemeData(),
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        color: Colors.white,
        elevation: 0,
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 35,
          fontWeight: FontWeight.w200,
          color: Colors.black,
        ),
      ),
    );
  }
}
