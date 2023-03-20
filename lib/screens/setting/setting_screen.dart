import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/component/component.dart';
import 'package:shop/model/login_model.dart';
import 'package:shop/model/profile_model.dart';
import 'package:shop/model/register_model.dart';
import 'package:shop/screens/categorise/categorise.dart';
import 'package:shop/screens/home_page/home_screen.dart';
import '../home_page/cubit/home_cubit.dart';
import '../home_page/cubit/home_states.dart';
import '../login/cubit/states.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, ProfileHomePage>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit1 = HomePageCubit.get(context);
        var cubit = SettingCubit.get(context);
        return (state is LoadingProfileHomePageStates)
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : buildBuildDrawing(cubit1, context, cubit);
      },
    );
  }

  Widget buildBuildDrawing(
      HomePageCubit cubit1, BuildContext context, SettingCubit cubit) {
    return buildDrawing(
      searchPress: (){},
      advancedDrawerController: cubit1.advancedDrawerController,
      image: cubit.profileModel!.data!.image.toString(),
      onTapHomeIcon: () {
        navigator(
          context,
          const HomePage(),
        );
      },
      onTapCategoriesIcon: () {
        navigator(
          context,
          const CategoriesScreen(),
        );
      },
      onTapFavouritesIcon: () {},
      onTapSettingIcon: () {},
      handleMenuButtonPressed: cubit1.handleMenuButtonPressed,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 75.0,
                height: 75.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  cubit.profileModel!.data!.image.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cubit.profileModel!.data!.name.toString(),
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      cubit.profileModel!.data!.phone.toString(),
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildUserName(Profile model) => Row(
        children: [
          Container(
            width: 75.0,
            height: 75.0,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.black26,
              shape: BoxShape.circle,
            ),
            child: Image.network(
              model.image.toString(),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name.toString(),
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  model.phone.toString(),
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      );
}
