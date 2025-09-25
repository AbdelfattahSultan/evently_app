import 'package:evently_app/common/SharedPreferences.dart';
import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/core/theme/theme.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:evently_app/screens/onboardingScreen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Evenly',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.getThemeMode(),
      routes: {Routes.onBoarding: (context) => Onboarding()},

      initialRoute: Routes.onBoarding,
    );
  }
}
