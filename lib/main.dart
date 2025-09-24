import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/core/theme/theme.dart';
import 'package:evently_app/screens/onboardingScreen/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Evenly',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.light
      ,
      routes: {
        Routes.onBoarding:(context) => Onboarding(),
      },
      
      initialRoute: Routes.onBoarding,

    );
  }
}
