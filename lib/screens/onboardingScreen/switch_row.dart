import 'package:evently_app/common/language_switch.dart';
import 'package:evently_app/common/theme_switch.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SwitchRow extends StatelessWidget {
  bool isTheme;
  SwitchRow({super.key, required this.isTheme});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          isTheme == true
              ? AppLocalizations.of(context)!.theme
              : AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        isTheme == true ? ThemeSwitch() : LanguageSwitch(),
      ],
    );
  }
}
