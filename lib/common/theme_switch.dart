import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

// ignore: camel_case_types
typedef onThemeChange = void Function(int index, Theme selectedLanguage);

enum Themes{ Dark, Ligth }

class ThemeSwitch extends StatefulWidget {

  final onThemeChange onLanChange;

  final List<Themes> themeList = [Themes.Ligth,Themes.Dark];

  ThemeSwitch(this.onLanChange, {Key? key}) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<ThemeSwitch> {
  Themes current = Themes.Ligth;
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<Themes>.rolling(
      current: current,
      values: widget.themeList,
      onChanged: (value) {
        setState(() {
          current = value;
        });
      },
      iconBuilder: (value, foreground) {
        if (value == Themes.Ligth) {
          return Icon(EvaIcons.sun);
        } else {
          return Icon(EvaIcons.moon);
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
