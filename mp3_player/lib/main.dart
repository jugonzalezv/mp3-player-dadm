import 'package:flutter/material.dart';
import 'songs.dart';
import "player.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), 
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SongsScreen()),
            );
          },
          child: const Text('Ver la lista de todas las canciones'),
    // return const MaterialApp(
    //   home: Scaffold(
    //     body: Center(
    //       child: MusicPlayerView(),
    //     ),
          ),
        )
    );
  }
}
