import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/component/component.dart';
import 'package:shop/screens/home_page/cubit/home_cubit.dart';
import 'package:shop/screens/home_page/cubit/home_states.dart';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/model/categories_model.dart';
import 'package:shop/model/product_model.dart';

import '../cart/cart.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return Scaffold(
          body: buildSingleChildScrollView(cubit),
        );
      },
    );
  }

  SingleChildScrollView buildSingleChildScrollView(HomePageCubit cubit) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Find you style',
              style: GoogleFonts.playfairDisplay(
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildCategories(cubit.categoriesModel!.data!.data!),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10.0,
                );
              },
              itemCount: 5,
            ),
          ),
          SizedBox(
            height: 400,
            child: CarouselSlider(
              items: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: const Image(
                            image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.jITYkmIVhr1wE3oSOsgfwQAAAA?pid=ImgDet&rs=1',
                            ),
                            height: 300,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: IconButton(
                            icon: const Icon(Icons.favorite_outline),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'White dress',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          r'$',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 18, color: Colors.red),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '225',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: const Image(
                            image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.6IjsJ8ZX1U3xi-5V_ZciZAHaE7?pid=ImgDet&rs=1',
                            ),
                            height: 300,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: IconButton(
                            icon: const Icon(Icons.favorite_outline),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Black dress',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          r'$',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 18, color: Colors.red),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '356',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: const Image(
                            image: NetworkImage(
                              'https://i.pinimg.com/474x/e4/36/9b/e4369b74fcbe5a47c440a9918e65ef3d.jpg',
                            ),
                            height: 300,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: IconButton(
                            icon: const Icon(Icons.favorite_outline),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Hody',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          r'$',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 18, color: Colors.red),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '60',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              options: CarouselOptions(
                height: 500.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.6,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text(
                  'Most ',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Popular',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30,
                    color: Colors.deepOrange.shade300,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 2100,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 10,
                  childAspectRatio: .75 / 1.58,
                ),
                itemBuilder: (context, index) =>
                    buildProduct(cubit.productModel!.data!.products!, context, cubit),
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategories(DataModel model) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.itim(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          )
        ],
      );
  Widget buildProduct(ProductModel model, context, HomePageCubit cubit) => Card(
        elevation: 30,
        shadowColor: Colors.black,
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: NetworkImage(
                          model.image.toString(),
                        ),
                        height: 290,
                        width: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: IconButton(
                        icon: cubit.favorite![model.id] == false
                            ? Icon(
                                Icons.favorite,
                                size: Theme.of(context).iconTheme.size,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border,
                                size: Theme.of(context).iconTheme.size,
                                color: Colors.black,
                              ),
                        onPressed: () {
                          print(model.id);
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  model.name.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      r'$',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 18, color: Colors.red),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      model.price.toString(),
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
