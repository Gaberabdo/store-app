import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/screens/home_page/cubit/home_cubit.dart';
import 'package:shop/screens/search/search_screen.dart';
import 'package:shop/screens/setting/cubit/cubit.dart';
import 'package:shop/screens/setting/setting_screen.dart';

import '../component/component.dart';
import '../model/product_model.dart';
import 'categorise/categorise.dart';
import 'home_page/cubit/home_states.dart';
import 'home_page/home_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        var cubit1 = SettingCubit.get(context);
        return buildDrawing(
          searchPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ),
            );
          },
          advancedDrawerController: cubit.advancedDrawerController,
          image: cubit1.profileModel!.data!.image.toString(),
          onTapHomeIcon: () {

            navigator(
              context,
              HomePage(),
            );
          },
          onTapCategoriesIcon: () {
            navigator(
              context,
              const CategoriesScreen(),
            );
          },
          onTapFavouritesIcon: () {},
          onTapSettingIcon: () {
            navigator(
              context,
              SettingScreen(),
            );
          },
          handleMenuButtonPressed: cubit.handleMenuButtonPressed,
          body: ConditionalBuilder(
            condition: state is! LoadingFavoritesHomePageStates,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) => buildListProduct(cubit.favoritesModel!.data!.data![index].product, context),
              separatorBuilder: (context, index) => SizedBox(height: 20,),
              itemCount: cubit.favoritesModel!.data!.data!.length,
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

}
Widget buildListProduct(
    model,
    context, {
      bool isOldPrice = true,
    }) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120.0,
                  height: 120.0,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: const Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color:Colors.red,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          HomePageCubit.get(context).changeFavorites( productId: model.id,);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                          HomePageCubit.get(context).favorite![model.id] == true
                              ? Colors.red
                              : Colors.grey,
                          child: const Icon(
                            Icons.favorite_border,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );