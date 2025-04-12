import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:for_private/audo_handler.dart';
import 'package:for_private/views/home/home_screen.dart';
import 'package:get/route_manager.dart';

//dart run change_app_package_name:main com.wonjongseo.sound-veil

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sound Veil',
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
