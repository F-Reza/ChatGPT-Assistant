import 'package:avatar_glow/avatar_glow.dart';
import 'package:chatbot/services/tts_functions.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../models/chat_model.dart';
import '../services/api_service.dart';
import '../widgets/main_drawer.dart';


class VoiceChatBot extends StatefulWidget {
  static const String routeName = '/voice_chat';

  const VoiceChatBot({Key? key}) : super(key: key);

  @override
  State<VoiceChatBot> createState() => _VoiceChatBotState();
}

class _VoiceChatBotState extends State<VoiceChatBot> {
  SpeechToText speechToText = SpeechToText();
  var text = "Hold the button and start speaking...";
  bool isListening = false;

  final List<ChatMessage> messages = [];

  var scrollController = ScrollController();
  scrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      //backgroundColor: const Color(0xFFCCCCFF),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: DraggableFab(
        child: AvatarGlow(
          glowColor: const Color(0xFFFF007F),
          endRadius: 75.0,
          animate: isListening,
          duration: const Duration(milliseconds: 2000),
          repeat: true,
          repeatPauseDuration: const Duration(milliseconds: 100),
          showTwoGlows: true,
          child: GestureDetector(
            onTapDown: (details) async {
              if (!isListening) {
                text = "Listening...";
                var available = await speechToText.initialize();
                if (available) {
                  setState(() {
                    isListening = true;
                    speechToText.listen(onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                        print("============> $text");
                      });
                    });
                  });
                }
              }
            },
            onTapUp: (details) async {
              setState(() {
                isListening = false;
              });
              await speechToText.stop();

              if(text.isEmpty && text != "Hold the button and start speaking..." && text != "Listening...") {
                messages.add(ChatMessage(text: text, type: ChatMessageType.user));
                print("<<<----Your Voice---->>>: $text");
                var msg = await ApiServices.sendMessage(text);
                msg = msg.trim();

                setState(() {
                  messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
                });

                Future.delayed(const Duration(milliseconds: 500),(){
                  TextToSpeech.speak(msg);
                });

              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Failed to process. Try again!")),
                );
              }


            },
            child: CircleAvatar(
              backgroundColor: const Color(0xFFF52887),
              radius: 35,
              child: Icon(
                isListening ? Icons.mic : Icons.mic_none,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        //backgroundColor: const Color(0xFFCCCCFF),
        centerTitle: true,
        title: const Text("Your Voice Assistant"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  color: isListening ? Colors.black87 : Colors.black38,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {

                    var chat = messages[index];

                    return chatBubble(
                        chatText: chat.text,
                        type: chat.type
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Custom Widget
  Widget chatBubble({required chatText, required ChatMessageType? type}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFF52887),
          child: type == ChatMessageType.bot ? Image.asset('assets/images/ChatGPT-Logo1.png') :Icon(Icons.person, color: Colors.white,),
        ),
        const SizedBox(width: 12,),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: type == ChatMessageType.bot ? const Color(0xFF8D918D) : Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
              ),
            ),
            child: Text(
              "$chatText",
              style: TextStyle(
                  color: type == ChatMessageType.bot ? Colors.white : Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
//0xFF00A67E