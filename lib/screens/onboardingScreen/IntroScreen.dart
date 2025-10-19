import 'package:evently_app/common/SharedPreferences.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/db/model/onBordingData.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/screens/onboardingScreen/ArrowButton.dart';
import 'package:evently_app/screens/onboardingScreen/dot_Indicator.dart';
import 'package:evently_app/screens/onboardingScreen/pageViewItem.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo),
            SizedBox(width: 10),
            Text(AppLocalizations.of(context)!.appTitle),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      currentSelectedIndex = index;
                    });
                  },
                  controller: pageController,
                  itemCount: OnBoardingData.onBoardingList.length,
                  itemBuilder: (context, index) {
                    var data = OnBoardingData.onBoardingList;
                    return PageViewItem(data: data[index]);
                  },
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      currentSelectedIndex != 0
                          ? ArrowButton(
                              icon: Icons.arrow_back,
                              onTap: () {
                                pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            )
                          : SizedBox(width: 20),
                      ArrowButton(
                        icon: Icons.arrow_forward,
                        onTap: () {
                          if (currentSelectedIndex <
                              OnBoardingData.onBoardingList.length - 1) {
                            pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            AppSharedPreferences.getInstance().onboardingCheck(
                              false,
                            );
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.login,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return DotIndicator(
                        isSelected: currentSelectedIndex == index,
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
