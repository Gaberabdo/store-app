import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/component/component.dart';
import 'package:shop/screens/categorise/categorise.dart';
import 'package:shop/screens/favorites_screen.dart';
import 'package:shop/screens/setting/cubit/cubit.dart';
import 'package:shop/screens/setting/setting_screen.dart';
import '../search/search_screen.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        var cubit1 = SettingCubit.get(context);
        return buildDrawing(
          searchPress: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen(),),);
          },
          advancedDrawerController: cubit.advancedDrawerController,
          image: cubit1.profileModel!.data!.image.toString(),
          onTapHomeIcon: () {},
          onTapCategoriesIcon: () {
            navigator(
              context,
              const CategoriesScreen(),
            );
          },
          onTapFavouritesIcon: (){
            navigator(
              context,
              const FavoritesScreen(),
            );
          },
          onTapSettingIcon: (){
            navigator(
              context,
               SettingScreen(),
            );
          },
          handleMenuButtonPressed: cubit.handleMenuButtonPressed,
          body: cubit.screens[cubit.index],
        );
      },
    );
  }
}
