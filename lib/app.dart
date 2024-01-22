import 'package:flutter/material.dart';
import 'package:learn_dio_service/pages/home_page.dart';
import 'package:learn_dio_service/pages/user_info.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const HomePage(),
      routes: {
        HomePage.id :(context)  => const HomePage(),
        UserInfo.id : (context) => const UserInfo()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
