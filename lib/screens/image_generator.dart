import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class ImageGenerator extends StatefulWidget {
  static const String routeName = '/Image_generator';
  const ImageGenerator({Key? key}) : super(key: key);

  @override
  State<ImageGenerator> createState() => _ImageGeneratorState();
}

class _ImageGeneratorState extends State<ImageGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFCCCCFF),
      drawer: const MainDrawer(),
      appBar: AppBar(
        //backgroundColor: const Color(0xFFCCCCFF),
        title: const Text("Image Generator"),
        centerTitle: true,
      ),
    );
  }
}
