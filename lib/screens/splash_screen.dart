import 'dart:async';

import 'package:flutter/material.dart';

import '../main.dart';
import '../onboarding/onboarding_page.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Timer(const Duration(seconds: 2),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
      => seenOnBoard == true ? const OnBoardingPage() :const HomePage(),));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFCCCCFF),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFCCCCFF),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1
                ),
                const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1
                ),
              ]
          ),
          alignment: Alignment.center,
          height: 40,
          //color: const Color(0xFFCCCCFF),
          child: const Text("Powered By NextDigit",
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        ),
        body: Container(
          alignment: Alignment.center,
          //color: const Color(0xFFCCCCFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text(
              //   'Welcome!',
              //   style: TextStyle(
              //       fontSize: 34,
              //       fontWeight: FontWeight.w700,
              //       color: Colors.black),
              // ),
              // const SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xFFCCCCFF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1
                        ),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1
                        ),
                      ]
                  ),
                  child: Image.asset('assets/images/ChatGPT-Logo2.png',width: 110,)),
            ],
          ),
        ),
      ),
    );
  }
}
