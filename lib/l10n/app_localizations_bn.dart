// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Crafty Bay';

  @override
  String get signUp => 'সাইন আপ';

  @override
  String get createAcc => 'আপনার অ্যাকাউন্ট তৈরি করুন';

  @override
  String get getStart => 'আপনার বিবরণ দিয়ে শুরু করুন';

  @override
  String get loginTitle => 'লগইন করুন';

  @override
  String get loginDescription => 'আপনার অ্যাকাউন্টের বিবরণ দিয়ে সাইন ইন করুন';

  @override
  String get otpCode => 'OTP দেন';

  @override
  String get otpDescription =>
      'আপনার ই-মেইল এ ৪ সংখ্যার একটি OTP কোড পাঠানো হয়েছে';
}
