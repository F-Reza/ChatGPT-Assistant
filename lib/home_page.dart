import 'package:flutter/material.dart';

import 'tts_functions.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat GPT Voice Chatbot'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textController,
          ),
          ElevatedButton(
              onPressed: () {
                TextToSpeech.speak(textController.text);
              },
              child: const Text("Speak")
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
