import 'package:chatbot/screens/image_generator.dart';
import 'package:chatbot/screens/voice_chat.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'chat_screen.dart';


class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const MainDrawer(),
      backgroundColor: const Color(0xFFCCCCFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCCCFF),
        centerTitle: true,
        title: const Text('Chat GPT Assistant'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, VoiceChatBot.routeName);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 180,
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
                    child: const Icon(Icons.mic,size: 55,),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ChatScreen.routeName);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 180,
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
                    child: const Icon(Icons.chat,size: 45,),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ImageGenerator.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                width: 280,
                height: 120,
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
                child: const Text("Image Generator",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
