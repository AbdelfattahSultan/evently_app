import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/provider/AuthProvider.dart';

import 'package:evently_app/screens/home/Tabs/profile/language_choose.dart';
import 'package:evently_app/screens/home/Tabs/profile/theme_choose.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    AppAuthProvider provider = Provider.of<AppAuthProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(64),
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.profileImage),
                      ),
                      color: AppColors.white,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(365),
                        bottomStart: Radius.circular(365),
                        topEnd: Radius.circular(365),
                        topStart: Radius.circular(12),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        provider.getUser()?.name ?? "",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.white),
                      ),
                      Text(
                        provider.getUser()?.email ?? "",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Language",
                style: context.fonts.bodySmall
              ),
            ),
            LanguageChoose(),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Theme",
                style: context.fonts.bodySmall,
              ),
            ),
            ThemeChoose(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  provider.logOut();
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Icon(Icons.logout, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text(
                      "Logout",
                      style: context.fonts.titleMedium?.copyWith(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
