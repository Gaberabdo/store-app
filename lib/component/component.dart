// ignore_for_file: constant_identifier_names



import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/screens/search/search_screen.dart';

import '../screens/setting/cubit/cubit.dart';

Widget buildTextForm({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  void Function()? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.satisfy(fontSize: 20, color: Colors.black),
        prefixIcon: Icon(
          prefix,
          color: Colors.black,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                  color: Colors.black,
                ),
              )
            : null,
        // enabledBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(width: .9, color: Colors.black),
        //   borderRadius: BorderRadius.circular(20),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(width: 1, color: Colors.brown),
        //   borderRadius: BorderRadius.circular(15),
        // )
      ),
    );

final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(5),
);

final kGradientBoxDecoration = BoxDecoration(
  gradient: const LinearGradient(colors: [Colors.grey, Colors.black]),
  borderRadius: BorderRadius.circular(5),
);

String token = '';

const LOGIN = 'login';


const REGISTER = 'register';

const HOME = 'home';

const GET_CATEGORIES = 'categories';

const FAVORITES = 'favorites';

const PROFILE = 'profile';

const UPDATE_PROFILE = 'update-profile';

const SEARCH = 'products/search';

const PRODUCT = 'products';



Widget buildDrawing({
  required AdvancedDrawerController advancedDrawerController,
  required String image,
  required void Function()? onTapHomeIcon,
  required void Function()? onTapCategoriesIcon,
  required void Function()? onTapFavouritesIcon,
  required void Function()? onTapSettingIcon,
  required void Function()? searchPress,

  required void Function()? handleMenuButtonPressed,
  required Widget body,
}) =>
    AdvancedDrawer(
      backdropColor: Colors.white60,
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child:
                    Image.network(image),
              ),
              ListTile(
                onTap: onTapHomeIcon,
                leading: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              ListTile(
                onTap: onTapCategoriesIcon,
                leading: const Icon(Icons.category_outlined),
                title: const Text('Categorise'),
              ),
              ListTile(
                onTap: onTapFavouritesIcon,
                leading: const Icon(Icons.favorite),
                title: const Text('Favourites'),
              ),
              ListTile(
                onTap: onTapSettingIcon,
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: searchPress,
              icon: const Icon(Icons.search_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.card_travel_outlined),
            ),
          ],
        ),
        body: body,
      ),
    );

void navigator(context, Widget widget) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => widget,
  ));
}
