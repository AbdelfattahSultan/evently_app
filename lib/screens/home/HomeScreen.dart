import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    AppAuthProvider authProvider = Provider.of<AppAuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          authProvider.getUserName()?.name??"",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.white),
        ),
        actions: [
          InkWell(
            onTap: () {
              authProvider.logOut();
              Navigator.pushReplacementNamed(context, Routes.login);
            },
            child: Icon(Icons.logout, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
