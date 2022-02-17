import 'package:flutter/material.dart';
import 'package:hm_onboard/feature/onboard/view/onboard_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Covid',
      home: OnboardView(),
      theme: ThemeData(
        primaryColor: const Color(0XFF5AA3C1),
      ),
    );
  }
}
