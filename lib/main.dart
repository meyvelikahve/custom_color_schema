import 'package:custom_schema/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme lightScheme = ColorScheme.fromSeed(
      seedColor: Colors.green,
      primary: context.watch<ThemeNotifier>().myColor,
    );
    return MaterialApp(
      title: 'Flutter Custom Schema Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        colorScheme: lightScheme,
      ),
      home: const MyHomePage(),
    );
  }
}
