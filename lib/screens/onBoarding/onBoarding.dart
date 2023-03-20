import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/helper/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../component/component.dart';
import '../login/login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

void submit(context) {
  CacheHelper.saveData(
    key: 'onBoarding',
    value: true,
  ).then((value){
    if(value){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
            (route) => false,
      );

    }
  });
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
      image: 'assets/images/onboard_1.jpg',
      title: 'Style',
      body: 'Classy Fashion',
    ),
    OnBoardingModel(
      image: 'assets/images/onboard_2.jpg',
      title: 'Fastacy',
      body: 'Most Popular',
    ),
    OnBoardingModel(
      image: 'assets/images/onboard_3.jpg',
      title: 'Collection',
      body: 'Find Your Style',
    ),
  ];
  var boardController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 650,
              child: PageView.builder(
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                physics: const BouncingScrollPhysics(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    expansionFactor: 2,
                    offset: 6,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.black,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tools ',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 20, fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'T-Shirts ',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 20, fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hoodies ',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 20, fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '126+ Categories',
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 20, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                    const VerticalDivider(
                      color: Colors.black45,
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
                    ),
                    const Spacer(),
                    MaterialButton(
                      color: Colors.black,
                      height: 50,
                      onPressed: () {
                        setState(() {
                          submit(context);
                        });
                      },
                      child: Text(
                        'Sign Up ~>',
                        style: GoogleFonts.satisfy(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(OnBoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${model.title}',
                style: GoogleFonts.playfairDisplay(
                    fontSize: 35, fontWeight: FontWeight.w200),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    Expanded(
                      child: Transform(
                        alignment: FractionalOffset.center,
                        transform: Matrix4.rotationZ(
                          3.14 / 1.4,
                        ),
                        child: Container(
                          // margin: const EdgeInsets.only(top: 20.0),

                          decoration: kGradientBoxDecoration,
                          // margin: const EdgeInsets.only(top: 20.0),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: kInnerDecoration,
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationZ(
                                  5.4 / 1.4,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        30), //border corner radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.4), //color of shadow
                                        spreadRadius: 6, //spread radius
                                        blurRadius: 10, // blur radius
                                        offset: const Offset(
                                            0, 2), // changes position of shadow
                                        //first paramerter of offset is left-right
                                        //second parameter is top to down
                                      ),
                                      //you can set more BoxShadow() here
                                    ],
                                  ),
                                  child: Image.asset(
                                    scale: double.maxFinite,
                                    model.image.toString(),
                                    height: 250,
                                    width: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    Text(
                      '${model.body}',
                      style: GoogleFonts.explora(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
