import 'package:flutter/material.dart';

import '../../../../app/set_up_network_client.dart';
import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../data/models/sign_in_params.dart';


class SignInProvider extends ChangeNotifier {
  bool _signInProgress = false;
  bool get signInProgress => _signInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInParams params) async {
    bool isSuccess = false;

    _signInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signInUrl,
      body: params.toJson()
    );

    if(response.isSuccess){
      _errorMessage = null;
      isSuccess = true;

    } else {
      _errorMessage = response.errorMessage;
    }

    _signInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
