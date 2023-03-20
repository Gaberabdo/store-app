// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:shop/screens/home_page/home_screen.dart';
import 'package:shop/screens/login/cubit/cubit.dart';
import 'package:shop/screens/login/cubit/states.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:shop/screens/register/register_screen.dart';

import '../../helper/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, LoginState>(
        listener: (context, state) {
          var cubit = ShopLoginCubit.get(context);

          if (state is SuccessLoginState) {
            if (state.loginModel.message != null) {
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              CacheHelper.saveData(
                key: 'token',
                value: cubit.modelLogin!.data!.token,
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
                (route) => false,
              );
            } else {
              print(state.loginModel.message);
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: ProsteThirdOrderBezierCurve(
                          position: ClipPosition.bottom,
                          list: [
                            ThirdOrderBezierCurveSection(
                              smooth: 1,
                              p1: const Offset(0, 300),
                              p2: const Offset(0, 400),
                              p3: const Offset(550, 240),
                              p4: const Offset(550, 400),
                            ),
                          ],
                        ),
                        child: Container(
                          height: 400,
                          width: double.maxFinite,
                          color: Colors.black54,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome Back',
                                style: GoogleFonts.satisfy(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Colors.black,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter your email address';
                                }
                                return null;
                              },
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: GoogleFonts.satisfy(
                                    fontSize: 20, color: Colors.black),
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                ),

                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: const BorderSide(width: .9, color: Colors.black),
                                //   borderRadius: BorderRadius.circular(20),
                                // ),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide: const BorderSide(width: 1, color: Colors.brown),
                                //   borderRadius: BorderRadius.circular(15),
                                // )
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: Colors.black,
                              controller: passwordController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: cubit.isPassword,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter your email password';
                                }
                                return null;
                              },
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                labelText: 'password',
                                labelStyle: GoogleFonts.satisfy(
                                    fontSize: 20, color: Colors.black),

                                suffixIcon: IconButton(
                                  onPressed: () {
                                    cubit.changePasswordVisibility();
                                  },
                                  icon: Icon(
                                    cubit.suffix,
                                    color: Colors.black,
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: const BorderSide(width: .9, color: Colors.black),
                                //   borderRadius: BorderRadius.circular(20),
                                // ),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide: const BorderSide(width: 1, color: Colors.brown),
                                //   borderRadius: BorderRadius.circular(15),
                                // )
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoadingLoginState,
                              builder: (context) => MaterialButton(
                                clipBehavior: Clip.none,
                                minWidth: double.infinity,
                                color: Colors.black54,
                                height: 35,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );

                                    print(emailController.text);
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.satisfy(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              fallback: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black54,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(children: <Widget>[
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 15.0),
                                    child: const Divider(
                                      color: Colors.black,
                                      height: 50,
                                    )),
                              ),
                              const Text("OR"),
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 15.0, right: 10.0),
                                    child: const Divider(
                                      color: Colors.black,
                                      height: 50,
                                    )),
                              ),
                            ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: GoogleFonts.satisfy(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    'Register',
                                    style: GoogleFonts.satisfy(
                                      fontSize: 20,
                                      color: Colors.brown,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
