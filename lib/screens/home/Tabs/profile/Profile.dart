import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/provider/AuthProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    AppAuthProvider provider = Provider.of<AppAuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
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
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        provider.getUser()?.email ?? "",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
