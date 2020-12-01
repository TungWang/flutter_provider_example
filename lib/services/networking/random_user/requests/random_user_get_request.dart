import 'package:http/http.dart' as http;

import '../../api_helper.dart';

class RandomUserGetRequest {
  final ApiHelper _apiHelper = ApiHelper();

  Future<http.Response> randomUserGetRequest({
    int userCount,
  }) {
    var url =
        'https://randomuser.me/api/?results=$userCount';
    return _apiHelper.get(url, '');
  }
}