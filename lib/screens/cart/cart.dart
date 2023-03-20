import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/screens/home_page/cubit/home_cubit.dart';
import 'package:shop/screens/home_page/cubit/home_states.dart';

class CartDetails extends StatelessWidget {
  CartDetails({Key? key, required this.productId}) : super(key: key);
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text(
              'Cart Details',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          body:ConditionalBuilder(
            condition: state is SuccessProductDetailsHomePageStates,
            builder:(context) =>  buildColumnCart(cubit),
            fallback: (context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Padding buildColumnCart(HomePageCubit cubit) {
    return Padding(
      padding:  EdgeInsets.all(20.0),
      child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child:  Image(
                        image: NetworkImage(
                          cubit.productDetailsModel!.image.toString(),
                        ),
                        height: 250,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                    cubit.productDetailsModel!.name.toString().substring(0, 15),
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          children: [
                            Text(
                              r'Price : ',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                            cubit.productDetailsModel!.price.toString(),
                              style: GoogleFonts.playfairDisplay(
                                  fontSize: 20, color: Colors.red),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.card_travel_outlined),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  cubit.productDetailsModel!.description.toString().substring(0, 500),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cairo(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12
                  ),
                  child: Divider(
                    height: 40,
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      r'Old price : ',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      r'$''${cubit.productDetailsModel!.oldPrice}',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      r'Discount : ',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      r'$''${cubit.productDetailsModel!.discount}',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Divider(
                    height: 40,
                    color: Colors.black45,
                    thickness: 2,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      r'Total : ',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      r'$ ''${cubit.productDetailsModel!.price}',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    clipBehavior: Clip.none,
                    minWidth: double.infinity,
                    color: Colors.black54,

                    height: 35,
                    onPressed: () {},
                    child: Text(
                      'AddToCard',
                      style: GoogleFonts.satisfy(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
