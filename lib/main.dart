import 'package:evently_app/common/SharedPreferences.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/core/theme/theme.dart';
import 'package:evently_app/provider/AuthProvider.dart';
import 'package:evently_app/provider/lan_provider.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:evently_app/screens/Login/Login.dart';
import 'package:evently_app/screens/Register/Register.dart';
import 'package:evently_app/screens/home/HomeScreen.dart';
import 'package:evently_app/screens/onboardingScreen/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppSharedPreferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => AppAuthProvider()),
      ],
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

    LanguageProvider lanProvider = Provider.of<LanguageProvider>(context);

    AppAuthProvider authProvider = Provider.of<AppAuthProvider>(context);

    return MaterialApp(
      title: 'Evenly',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.getThemeMode(),

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: lanProvider.getLocalLanguage(),

      routes: {
        Routes.onBoarding: (context) => Onboarding(),
        Routes.register: (context) => Register(),
        Routes.login: (context) => Login(),
        Routes.home: (context) => HomeScreen(),
      },

      initialRoute: authProvider.isLoginBefore() ? Routes.home : Routes.login ,
    );
  }
}
