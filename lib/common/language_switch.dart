import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/provider/lan_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  @override
  Widget build(BuildContext context) {
    LanguageProvider lanProvider = Provider.of<LanguageProvider>(context);

    return AnimatedToggleSwitch<Locale>.rolling(
      current: lanProvider.getLocalLanguage(),
      values: lanProvider.languageList(),
      onChanged: (value) {
        setState(() {
          lanProvider.changeLocale(value);
        });
      },
      iconBuilder: (value, foreground) {
        if (value == Locale("en")) {
          return Flag(Flags.united_kingdom);
        } else {
          return Flag(Flags.egypt);
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
