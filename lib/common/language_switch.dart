import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

// ignore: camel_case_types
typedef onLanguageChange = void Function(int index, Language selectedLanguage);

enum Language { EN, AR }

class LanguageSwitch extends StatefulWidget {
  final onLanguageChange onLanChange;

  final List<Language> languagesList = [Language.EN, Language.AR];

  LanguageSwitch(this.onLanChange, {super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  Language current = Language.EN;
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<Language>.rolling(
      current: current,
      values: widget.languagesList,
      onChanged: (value) {
        setState(() {
          current = value;
        });
      },
      iconBuilder: (value, foreground) {
        if (value == Language.AR) {
          return Flag(Flags.egypt);
        } else {
          return Flag(Flags.united_kingdom);
        }
      },
      style: ToggleStyle(
        indicatorColor: Theme.of(context).colorScheme.primary,
        borderColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
