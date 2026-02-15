import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Logingoogle extends StatelessWidget {
  const Logingoogle({super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    AppAuthProvider provider = Provider.of<AppAuthProvider>(context);
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: OutlinedButton(
        onPressed: () async {
          await provider.signInWithGoogle();
          Navigator.pushReplacementNamed(context, Routes.home);
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(16),
          side: BorderSide(
            width: 2,
            color: AppColors.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.google, width: 24, height: 24),
            SizedBox(width: 10),
            Text(
              l10n.google,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
