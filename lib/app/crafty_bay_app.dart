
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../features/auth/presentation/screen/splash_screen.dart';
import '../l10n/app_localizations.dart';
import 'app_theme.dart';
import 'routes.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crafty Bay',
      initialRoute: SplashScreen.name,
      onGenerateRoute:  Routes.onGenerateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      // localizationsDelegates: [
      //   AppLocalizations.delegate, // Add this line
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      localizationsDelegates: AppLocalizations.localizationsDelegates, // এটি ব্যবহার করুন
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),

      // supportedLocales: AppLocalizations.supportedLocales,
      // locale: Locale('en'),
    );
  }
}
