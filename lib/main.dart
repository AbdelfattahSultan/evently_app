import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:evently_app/common/SharedPreferences.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/core/theme/theme.dart';
import 'package:evently_app/provider/AuthProvider.dart';
import 'package:evently_app/provider/lan_provider.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:evently_app/screens/EditEvent/Edit_Event.dart';
import 'package:evently_app/screens/EventDetails/Event_Details.dart';
import 'package:evently_app/screens/Login/Login.dart';
import 'package:evently_app/screens/Register/Register.dart';
import 'package:evently_app/screens/home/HomeScreen.dart';
import 'package:evently_app/screens/home/Tabs/createEvent/createEvent.dart';
import 'package:evently_app/screens/onboardingScreen/IntroScreen.dart';
import 'package:evently_app/screens/onboardingScreen/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppSharedPreferences.init();
  bool isFirstTime = AppSharedPreferences.getInstance().isOnboarding();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => AppAuthProvider()),
      ],
      child: MyApp(isFirstTime: isFirstTime),
    ),
  );
}

class MyApp extends StatelessWidget {
  bool isFirstTime;
  MyApp({super.key, required this.isFirstTime});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    LanguageProvider lanProvider = Provider.of<LanguageProvider>(context);

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
        Routes.createEvent: (context) => CreateEvent(),
        Routes.intro: (context) => IntroScreen(),
        Routes.eventDetails: (context) => EventDetails(),
        Routes.editEvent: (context) => EditEvent(),
      },
      home: MySplashScreen(isFirstTime: isFirstTime),
    );
  }
}

class MySplashScreen extends StatelessWidget {
  final bool isFirstTime;
  const MySplashScreen({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    AppAuthProvider authProvider = Provider.of<AppAuthProvider>(context);

    Widget nextScreen;
    if (isFirstTime) {
      nextScreen = Onboarding();
    } else if (authProvider.isLoginBefore()) {
      nextScreen = HomeScreen();
    } else {
      nextScreen = Login();
    }

    return AnimatedSplashScreen(
      splashIconSize: double.infinity,

      splash: Column(
        children: [
          Spacer(),
          Image.asset(AppImages.splashLogo, width: 150),
          Spacer(),
          Image.asset(AppImages.branding, width: 200),
          SizedBox(height: 60),
        ],
      ),
      nextScreen: nextScreen,
      duration: 2500,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.white,
    );
  }
}
