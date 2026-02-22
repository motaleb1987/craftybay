
import 'package:flutter/material.dart';
import '../features/auth/presentation/screen/sign_up_screen.dart';
import '../features/auth/presentation/screen/splash_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
   late Widget widget;

    switch (settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
      case SignUpScreen.name:
        widget = SignUpScreen();
    }
    return  MaterialPageRoute(builder: (context) => widget);
  }
}