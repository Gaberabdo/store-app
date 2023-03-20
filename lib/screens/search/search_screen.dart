import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/model/search_model.dart';
import 'package:shop/screens/home_page/cubit/home_cubit.dart';
import 'package:shop/screens/home_page/cubit/home_states.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return  Scaffold(
          appBar: AppBar(),
          body: Form(
            key:formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onFieldSubmitted: (String text){
                      cubit.postSearchProduct(text);
                    },
                    cursorColor: Colors.black,
                    controller: searchController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'enter text to search';
                      }
                      return null;
                    },
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: GoogleFonts.satisfy(
                          fontSize: 20, color: Colors.black),

                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: .9, color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.brown),
                        borderRadius: BorderRadius.circular(15),
                      )
                    ),
                  ),
                ),
                if (state is LoadingSearchHomePageStates) const RefreshProgressIndicator(),
                const SizedBox(
                  height: 10.0,
                ),
                if (state is SuccessSearchHomePageStates)
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>buildColumnCart(cubit.searchModel!.data.product[index]),

                      separatorBuilder: (context, index) => const SizedBox(
                        width: 5,
                      ),
                      itemCount:cubit.searchModel!.data.product.length,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
  Padding buildColumnCart(Product model) {
    return Padding(
      padding:  const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child:  Image(
                  image: NetworkImage(
                    model.image.toString(),
                  ),
                  height: 250,
                  width: 200,
                  fit: BoxFit.contain,
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
                    model.name.toString().substring(0, 15),
                    maxLines: 2,
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
                        model.price.toString(),
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
            model.description.toString().substring(0, 250),
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
              const Spacer(),
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
              const Spacer(),
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
              const Spacer(),
              Text(
                r'$ ''${model.price}',
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
