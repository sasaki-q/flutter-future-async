import 'package:asyncdemo/async_value/screen.dart';
import 'package:asyncdemo/future_provider/screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const App(),
      routes: {
        '/async': (BuildContext context) => const AsyncValueScreen(),
        '/future': (BuildContext context) => const FutureProviderScreen(),
      },
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _pushScreen({required String path}) =>
        Navigator.of(context).pushNamed(path);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _pushScreen(path: "/async"),
              child: const Text("to async screen"),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => _pushScreen(path: "/future"),
              child: const Text("to future screen"),
            ),
          ],
        ),
      ),
    );
  }
}
