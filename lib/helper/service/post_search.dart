import 'package:shop/component/component.dart';


import '../../model/search_model.dart';
import '../api.dart';

class PostSearch {
  Future<SearchModel> postSearch({
    required String text

  }) async {
    Map<String, dynamic> data = await Api().post(
      url: SEARCH,
      body: {
        'text': text,
      },
      token: '',

    );

    return SearchModel.fromJson(data);
  }
}
