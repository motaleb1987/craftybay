
import 'package:craftybay/app/providers/localization_provider.dart';
import 'package:craftybay/app/providers/theme_provider.dart';
import 'package:craftybay/features/auth/presentation/providers/main_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import '../features/auth/presentation/screen/splash_screen.dart';
import '../l10n/app_localizations.dart';
import 'app_theme.dart';
import 'routes.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_)=> LocalizationProvider()..loadLocal(),
        ),
        ChangeNotifierProvider(create: (_)=> ThemeProvider()..loadThemeMode(),),
        ChangeNotifierProvider(create: (_)=> MainNavProvider())
      ],
      child: Consumer<LocalizationProvider>(
        builder: (context, localizationProvider, _) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return MaterialApp(
                title: 'Crafty Bay',
                initialRoute: SplashScreen.name,
                onGenerateRoute:  Routes.onGenerateRoute,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeProvider.themeMode,
                localizationsDelegates: [
                  AppLocalizations.delegate, // Add this line
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: localizationProvider.supportedLocals,
                locale: localizationProvider.local,
              );
            }
          );
        }
      ),
    );
  }
}
