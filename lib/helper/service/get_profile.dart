import 'package:dio/dio.dart';
import 'package:shop/component/component.dart';

import '../../model/profile_model.dart';
import '../api.dart';
import 'package:http/http.dart' as http;

class GetProfile {
  Future<ProfileModel> getProfile() async {
    // final  data = await Dio(
    // //   BaseOptions(
    // //     baseUrl: 'https://student.valuxapps.com/api/',
    // //     receiveDataWhenStatusError: true,
    // //     headers: {
    // //       'lang': 'en',
    // //       'Authorization': token,
    // //       'Content-Type': 'application/json',
    // //     },
    // //   ),
    // // ).get(PROFILE);
    // // print('adsffffffffffffffff${data.data.toString()}');
    // // return Profile.fromJson(data.data);
    Map<String, dynamic> data = await Api().get(
      url: PROFILE,

    );
    print('sdjfsdfvsdjf${data}');
    return ProfileModel.fromJson(data);
  }
}
// // String baseUrl = 'https://student.valuxapps.com/api/';
// // String url = '$baseUrl$PROFILE';
// // http.Response response = http.get(
// //   Uri.parse(url),
// //   headers: {
// //     'lang':'en',
// //     'Authorization': token,
// //     'Content-Type': 'application/json',
// //   },
// // );
// //
//
