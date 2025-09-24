import 'package:evently_app/common/custom_button.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/screens/onboardingScreen/switch_row.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo),
              SizedBox(width: 10),
              Text("Evently"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(AppImages.onBoarding1, width: double.infinity),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 28),
                    Text(
                      "Personalize Your Experience",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 28),
                    Text(
                      "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 28),
                    Column(
                      children: [
                        SwitchRow(isTheme: false),
                        SizedBox(height: 20),
                        SwitchRow(isTheme: true),
                      ],
                    ),
                    Spacer(),
                    CustomButton(onTap: () {}, content: "Let’s Start"),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
