// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Crafty Bay';

  @override
  String get signUp => 'Sign up';

  @override
  String get createAcc => 'Create Your Account';

  @override
  String get getStart => 'Get started with your details';

  @override
  String get loginTitle => 'Login to your Account';

  @override
  String get loginDescription => 'Sign In with your account details';

  @override
  String get otpCode => 'Enter OTP Code';

  @override
  String get otpDescription =>
      'A 4 digit opt has been sent to your email address';
}
