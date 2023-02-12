import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennisapp/provider/home_provider.dart';
import 'package:tennisapp/provider/provider.dart';

import 'package:tennisapp/screens/screens.dart';
import 'package:tennisapp/services/services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeService()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      scaffoldMessengerKey: NotificationsService.messengerKey,
      routes: {
        'home': (context) => const HomeScreen(),
        'cancha': (context) => const CanchaScreen(),
      },
    );
  }
}
