
// Best practice => Service Locator/Dependency Injection Manager

import 'package:craftybay/app/controllers/auth_controller.dart';
import 'package:craftybay/app/crafty_bay_app.dart';
import 'package:craftybay/features/auth/presentation/screen/sign_in_screen.dart';

import '../core/network_caller/network_caller.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
      headers: () =>{
        'Content-Type': 'application/json',
      },
      onUnauthorize: () async {
        // Logout from app
        // Clear user Data
        // Redirect to the sign in ui
        await AuthController.clearUserData();
        CraftyBayApp.navigatorKey.currentState!.pushNamed(SignInScreen.name);
      }
  );
}


// Uses => getNetworkCaller.getRequest/postRequest.....