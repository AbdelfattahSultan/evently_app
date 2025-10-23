import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);

    return AnimatedToggleSwitch<ThemeMode>.rolling(
      current: provider.getThemeMode(),
      values: provider.modes(),
      onChanged: (newMode) {
        setState(() {
          provider.changeMode(newMode);
        });
      },
      iconBuilder: (value, foreground) {
        if (value == ThemeMode.light) {
          return Icon(EvaIcons.sun);
        } else {
          return Icon(EvaIcons.moon);
        }
      },
      style: ToggleStyle(
        indicatorColor: Theme.of(context).colorScheme.primary,
        borderColor: AppColors.primary,
        backgroundColor: AppColors.primary.withOpacity(0.1),
      ),
    );
  }
}
