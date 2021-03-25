import 'package:dsc/ui/contactus.dart';
import 'package:dsc/ui/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dsc/constants/constants.dart';
import 'package:dsc/ui/signin.dart';
import 'package:dsc/ui/signup.dart';
import 'package:dsc/ui/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  //final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      theme: ThemeData(primaryColor: Colors.orange[200]),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        SIGN_IN: (BuildContext context) => SignInPage(),
        SIGN_UP: (BuildContext context) => SignUpScreen(),
        DASHBOARD: (BuildContext context) => Dashboard(),
        CONTACTUS: (BuildContext context) => Contact(),
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}
