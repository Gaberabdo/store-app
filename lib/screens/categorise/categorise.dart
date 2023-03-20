import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/screens/home_page/cubit/home_cubit.dart';
import 'package:shop/screens/home_page/cubit/home_states.dart';
import 'package:shop/screens/home_page/home_screen.dart';

import '../../component/component.dart';
import '../../model/categories_model.dart';
import '../setting/cubit/cubit.dart';
import '../setting/setting_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit1 = SettingCubit.get(context);
        var cubit = HomePageCubit.get(context);
        return buildDrawing(
          searchPress: (){

          },
          advancedDrawerController: cubit.advancedDrawerController,
          image: cubit1.profileModel!.data!.image.toString(),
          onTapHomeIcon: () {
            navigator(
              context,
              const HomePage(),
            );
          },
          onTapCategoriesIcon: () {},
          onTapFavouritesIcon: () {},
          onTapSettingIcon: () {
            navigator(
              context,
               SettingScreen(),
            );
          },
          handleMenuButtonPressed: cubit.handleMenuButtonPressed,
          body: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildCatItem(cubit.categoriesModel!.data!),
            separatorBuilder: (context, index) => Container(),
            itemCount: 5,
          ),
        );
      },
    );
  }

  Widget buildCatItem(CategoriesDataModel model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(model.data!.image),
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              model.data!.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      );
}
