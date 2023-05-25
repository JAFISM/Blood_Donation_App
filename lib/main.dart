import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud_example/project1/add.dart';
import 'package:firebase_crud_example/project1/home.dart';
import 'package:firebase_crud_example/project1/splash_screen.dart';
import 'package:firebase_crud_example/project1/update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // run the initialization for the web
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    // run the initialization for the android , ios
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white))),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        //'splash': (context) => const SplashScreen(),
        'home': (context) => const HomePage(),
        'add': (context) => const AddUser(),
        'update': (context) => const UpdateUser()
      },
      initialRoute: 'home',
    );
  }
}
