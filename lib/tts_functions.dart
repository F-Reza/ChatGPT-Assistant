import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  static FlutterTts tts = FlutterTts();

  static initTTS() async {

    // var response = await tts.getLanguages;
    // print("All Language: $response");

    tts.setLanguage("en-US");
    // tts.setPitch(1.0);
    // tts.setSpeechRate(0.0);
    // tts.setVolume(1.0);
  }

  static speak(String text) async {

    tts.setStartHandler(() {
      print("===> TTS IS STARTED:");
    });
    tts.setCompletionHandler(() {
      print("===> COMPLETED!!!");
    });
    tts.setErrorHandler((message) {
      print("===> EROOR: $message");
    });

    await tts.awaitSpeakCompletion(true);

    tts.speak(text);
  }

}