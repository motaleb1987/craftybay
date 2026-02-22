import 'package:craftybay/features/auth/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget widget = SizedBox();

    switch (settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
    }
    return  MaterialPageRoute(builder: (context) => widget);
  }
}