
import 'package:craftybay/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app/crafty_bay_app.dart';
// important setup must be apply
// 1. Firebase set up
// 2. Crashlytics setup [app crash or error notify er jonno use]
// 3. Analytics setup   [app kothay use hocche,  er jonno use]
// 4. Provider setup
// 5. Localization setup [Language]
// 6. Architecture Design [folder structure]
// 7. Theming setup


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const CraftyBayApp());
}
