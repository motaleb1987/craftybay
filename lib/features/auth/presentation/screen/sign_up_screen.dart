import 'package:craftybay/app/extensions/localization_extension.dart';
import 'package:craftybay/app/providers/localization_provider.dart';
import 'package:craftybay/features/shared/presentation/widgets/theme_switcher.dart';
import 'package:craftybay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/widgets/language_switcher.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/sign-up';


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.signUp),
      ),
      body: Column(
        children: [
          // LanguageSwitcher()
          ThemeSwitcher()
        ],
      ),
    );
  }
}


