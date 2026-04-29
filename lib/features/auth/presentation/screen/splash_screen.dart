
import 'package:craftybay/app/controllers/auth_controller.dart';
import 'package:craftybay/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import '../../../shared/presentation/screens/main_nav_holder_screen.dart';
import '../widgets/app_logo.dart';
import 'sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    await AuthController.loadUserData();
    Navigator.pushReplacementNamed(context, MainNavHolderScreen.name);
    //Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(child: AppLogo()),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
