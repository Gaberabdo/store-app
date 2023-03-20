// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/helper/local/dio_helper.dart';
import 'package:shop/helper/service/get_product.dart';
import 'package:shop/model/categories_model.dart';
import 'package:shop/model/favorites_model.dart';
import 'package:shop/model/product_model.dart';
import 'package:shop/screens/product/product_screen.dart';

import '../../../component/component.dart';
import '../../../helper/service/get_categorise.dart';
import '../../../helper/service/get_favorites.dart';
import '../../../helper/service/post_favorites.dart';
import '../../../helper/service/post_search.dart';
import '../../../model/search_model.dart';
import 'home_states.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit(this.categoriseService) : super(InitialHomePageStates());
  static HomePageCubit get(context) => BlocProvider.of(context);

  int index = 0;
  List<Widget> screens = [
    const ProductScreen(),
  ];

  GetCategorise? categoriseService;
  CategoriesModel categoriesModel = CategoriesModel(status: 'status', data: null);
  void getCategories() async {
    emit(LoadingCategoriesHomePageStates());
    try {
      categoriesModel = await categoriseService!.getCategorise();
      emit(SuccessCategoriesHomePageStates());
    } on Exception catch (error) {
      print(error);
      emit(ErrorCategoriesHomePageStates());
    }
  }

  HomeModelPage productModel = HomeModelPage(status: true, data: null);
  void getProduct() async {
    emit(LoadingProductHomePageStates());
    try {
      productModel = await GetProduct().getProduct();
      emit(SuccessProductHomePageStates());
    } on Exception catch (error) {
      print(error);
      emit(ErrorProductHomePageStates());
    }
  }

  ProductModel productCubit = ProductModel(
      id: 1,
      name: 'name',
      inFavorites: true,
      price: 'price',
      description: 'description',
      image: 'image',
      oldPrice: 'oldPrice',
      discount: 'discount',
      inCart: true);

  ProductModel productDetailsModel=ProductModel(
  id: 1,
  name: 'name',
  inFavorites: true,
  price: 'price',
  description: 'description',
  image: 'image',
  oldPrice: 'oldPrice',
  discount: 'discount',
  inCart: true);
  void getProductDetails() async {
    emit(LoadingProductDetailsHomePageStates());
    try {
      productDetailsModel = await GetProductDetails()
          .getProductDetails(productId: productDetailsModel!.id!.toInt());
      emit(SuccessProductDetailsHomePageStates());
      print(productDetailsModel.toString());
    } on Exception catch (error) {
      print(error);
      emit(ErrorProductDetailsHomePageStates());
    }
  }

  SearchModel? searchModel;
  void postSearchProduct(String text) async {
    emit(LoadingSearchHomePageStates());
    try {
      searchModel = await PostSearch().postSearch(text: text);
      emit(SuccessSearchHomePageStates());
      print(productDetailsModel.toString());
    } on Exception catch (error) {
      print(error);
      emit(ErrorSearchHomePageStates());
    }
  }

  FavoritesModel? favoritesModel ;
  void getFavorites() async {
    emit(LoadingFavoritesHomePageStates());
    try {
      favoritesModel = await GetFavorites().getFavorites();
      emit(SuccessFavoritesHomePageStates());
    } on Exception catch (error) {
      print(error);
      emit(ErrorFavoritesHomePageStates());
    }
  }

  Map<dynamic, bool>? favorite = {};

  FavoritesModel? changeFavoritesModel;
  void changeFavorites({required int productId}) async {
    favorite![productId] = !favorite![productId]!;

    if (changeFavoritesModel!.status == null) {
      favorite![productId] = !favorite![productId]!;
    } else {
      getFavorites();
    }
    emit(LoadingChangeFavoritesHomePageStates());
    try {
      favoritesModel =
          await PostFavorites().postFavorites(productId: productId);
      emit(SuccessChangeFavoritesHomePageStates());
    } on Exception catch (error) {
      print(error);
      emit(ErrorChangeFavoritesHomePageStates());
    }
  }

  var advancedDrawerController = AdvancedDrawerController();
  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
    emit(ChangeBottomAppBarDrawerState());
  }
}
