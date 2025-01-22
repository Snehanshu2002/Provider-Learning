import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management1/list_map_provider.dart';
import 'package:state_management1/list_page.dart';
import 'package:state_management1/provider.dart';
import 'package:state_management1/theme_provider.dart';

import 'counter_provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ListMapProvider(),),
          ChangeNotifierProvider(create: (context) => CounterProvider(),),
          ChangeNotifierProvider(create: (context) => ThemeProvider(),),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: context.watch<ThemeProvider>().getThemeValue()
          ?ThemeMode.dark
        :ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListPage()
    );
  }
}

