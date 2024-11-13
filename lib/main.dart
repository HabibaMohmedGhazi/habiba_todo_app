import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/auth/provider/auth_provider.dart';
import 'package:my_todo_app/auth/view/login_screen.dart';
import 'package:my_todo_app/auth/view/signup_screen.dart';
import 'package:my_todo_app/ui/providers/task_provider.dart';
import 'package:my_todo_app/ui/screens/the_main_screen.dart';
import 'package:my_todo_app/ui/screens/the_splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_todo_app/ui/utilities/common/app_theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

// make the main function Future as the firebase
Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // you have to add this by yourself as we add async to the main function
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // this line is written if you make an app that works in more than 1 platform
  );
  // by using the line below there is a local data base created in the user device and it adds the data inside it not in the remote database
  // FirebaseFirestore.instance.disableNetwork();

  // by using the line below the device will not delete the cache after a limited time
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(
    // we have to create the provider here to use it inside the app ' Imp. '
    MultiProvider( // we use multi provider to use more than one provider
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
          child: const MyApp(),
        ),
        ChangeNotifierProvider(
          create: (context) => TheAuthProvider(),
        )
      ],
      child: const MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: ThemeData(),
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: const Locale('en'),
      routes: {
        TheSplashScreen.theRouteName: (_) => const TheSplashScreen(),
        TheMainScreen.theRouteName: (_) => const TheMainScreen(),
        TheSignUpScreen.theRouteName: (_) => const TheSignUpScreen(),
        TheLoginScreen.theRouteName: (_) => const TheLoginScreen(),
      },
      initialRoute: TheMainScreen.theRouteName,
    );
  }
}
