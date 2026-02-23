import 'package:craftybay/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

extension LocalizationExtension on BuildContext{
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}