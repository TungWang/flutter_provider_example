import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_provider_example/services/networking/random_user/models/random_user_model.dart';
import 'package:flutter_provider_example/services/networking/random_user/requests/random_user_get_request.dart';

class RandomUserGetProvider with ChangeNotifier {
  RandomUserModel _model;
  bool _loading = false;
  String _error;

  Future<bool> fetchData({
    @required int userCount,
  }) async {
    _setLoading(true);
    var response = await RandomUserGetRequest().randomUserGetRequest(
      userCount: userCount,
    );
    _setLoading(false);
    if (response.statusCode == 200) {
      var model = RandomUserModel.fromJson(json.decode(response.body));
      _setError(null);
      _setModel(model);
      return true;
    } else {
      _setError(response.reasonPhrase);
      _setModel(null);
      return false;
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool isLoading() => _loading;

  RandomUserModel getModel() => _model;

  void _setModel(RandomUserModel value) {
    _model = value;
  }

  String getError() => _error;

  void _setError(String value) {
    _error = value;
  }
}
