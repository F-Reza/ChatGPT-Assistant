import 'package:flutter/material.dart';

import 'onboarding/size_configs.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Image.asset('assets/images/splash_image.png'),
            ],
          ),
        ),
      ),
    );
  }
}
