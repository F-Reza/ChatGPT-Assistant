import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_bording/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding/app_styles.dart';
import 'onboarding/onboarding_page.dart';

bool? seenOnBoard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // to show status bar
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom,
      SystemUiOverlay.top],
  );
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnBoard = pref.getBool('ON_BOARDING') ?? true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit App',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kScaffoldBackground,
      ),
      home: seenOnBoard == true ? const OnBoardingPage() : const SignUpPage(),
    );
  }
}
