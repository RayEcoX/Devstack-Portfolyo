import 'package:flutter/material.dart';

import 'anasayfa.dart';
import 'liste_sayfasi.dart';
import 'detay_sayfasi.dart';

void main() {
  runApp(const DevStackApp());
}

class DevStackApp extends StatelessWidget {
  const DevStackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevStack Portfolyo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
        ),
        cardColor: Colors.grey[900],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AnaSayfa(),
        '/skills': (context) => const ListeSayfasi(),
        '/detail': (context) => const DetaySayfasi(),
      },
    );
  }
}
