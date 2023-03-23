

import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';
import '../screens/home_page.dart';
import '../screens/image_generator.dart';
import '../screens/voice_chat.dart';


class MainDrawer extends StatefulWidget {
  static const String routeName = '/main_drawer';
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFCCCCFF),
      child: ListView(
        children: [
          Container(
            height: 200,
            color: const Color(0xFF444654),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('images/male.png',
                      height: 100, width: 100, fit: BoxFit.cover),

              //     AuthService.user!.photoURL == null ? Image.asset('images/male.png',
              //         height: 100, width: 100, fit: BoxFit.cover)
              // :Image.network(AuthService.user!.photoURL!,
              //         height: 100, width: 100, fit: BoxFit.cover),
                ),
                const SizedBox(height: 10,),
                //AuthService.user!.email!
                const Text("info@gmail.com",
                  style: TextStyle(fontSize: 16,color: Colors.white),),
              ],
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
            leading: const Icon(Icons.dashboard,),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
            leading: const Icon(Icons.photo_library,),
            title: const Text('My Gallery'),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, VoiceChatBot.routeName),
            leading: const Icon(Icons.mic,),
            title: const Text('Voice Chat'),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, ChatScreen.routeName),
            leading: const Icon(Icons.chat,),
            title: const Text('ChatBOT'),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, ImageGenerator.routeName),
            leading: const Icon(Icons.add_photo_alternate_outlined,),
            title: const Text('Image Generator'),
          ),
          /*ListTile(
            onTap: () => Navigator.pushNamed(context, ChangePassword.routeName),
            leading: const Icon(Icons.change_circle,),
            title: const Text('Change Your Password'),
          ),*/
          ListTile(
            onTap: () {
              // AuthService.logout().then((value) =>
              //     Navigator.pushNamed(context, LoginPage.routeName));
            },
            leading: const Icon(Icons.logout,),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
