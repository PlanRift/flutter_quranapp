import 'package:flutter/material.dart';
import 'package:quran_app/Pages/detail_screen.dart';
import 'package:quran_app/Pages/doa_detail.dart';
import 'package:quran_app/Pages/dzikir_detail.dart';
import 'package:quran_app/Pages/home_screen.dart';
import 'package:quran_app/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      initialRoute: HomeScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(id_surah: ModalRoute.of(context)?.settings.arguments as String),
        DzikirDetail.routeName:(context) => DzikirDetail(id_dzikir: ModalRoute.of(context)?.settings.arguments as String),
        DoaDetail.routeName:(context) => DoaDetail(id_doa: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
