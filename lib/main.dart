import 'dart:io';

import 'package:flutter/material.dart';

import 'home_page.dart';
import 'text_chat.dart';
import 'tts_functions.dart';
import 'voice_chat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  TextToSpeech.initTTS();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat GPT Voice Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: VoiceChatBot.routeName,
      routes: {
        HomePage.routeName : (_) => const HomePage(),
        TextChatBot.routeName : (_) => const TextChatBot(),
        VoiceChatBot.routeName : (_) => const VoiceChatBot(),
      },
    );
  }
}




class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}