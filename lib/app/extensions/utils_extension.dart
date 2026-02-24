import 'package:craftybay/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension UtilsExtension on BuildContext{
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  TextTheme get textTheme => TextTheme.of(this);

}