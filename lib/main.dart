import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/constants.dart';
import 'providers/chats_provider.dart';
import 'providers/models_provider.dart';
import 'screens/developer_info.dart';
import 'screens/home_page.dart';
import 'screens/chat_screen.dart';
import 'screens/my_gallery.dart';
import 'screens/splash_screen.dart';
import 'services/tts_functions.dart';
import 'screens/image_generator.dart';
import 'screens/voice_chat.dart';
import 'widgets/main_drawer.dart';

bool? seenOnBoard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  TextToSpeech.initTTS();

  // to show status bar
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom,
      SystemUiOverlay.top],
  );

  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnBoard = pref.getBool('ON_BOARDING') ?? true;

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NextDigit Assistant',
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
            color: cardColor,
          ),
          //primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName : (_) => const SplashScreen(),
          DeveloperInfo.routeName : (_) => const DeveloperInfo(),
          MainDrawer.routeName : (_) => const MainDrawer(),
          HomePage.routeName : (_) => const HomePage(),
          ImageGenerator.routeName : (_) => const ImageGenerator(),
          ChatScreen.routeName : (_) => const ChatScreen(),
          VoiceChatBot.routeName : (_) => const VoiceChatBot(),
          MyGallery.routeName : (_) => const MyGallery(),
        },
      ),
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