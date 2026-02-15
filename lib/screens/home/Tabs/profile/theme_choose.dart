import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';


class ThemeChoose extends StatefulWidget {

  bool isTheme;
  ThemeChoose({super.key, this.isTheme = false});

  @override
  State<ThemeChoose> createState() => _ThemeChooseState();
}

class _ThemeChooseState extends State<ThemeChoose> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButton<ThemeMode>(
        value: themeProvider.getThemeMode(),
        isExpanded: true,
        underline: const SizedBox(),
        icon: Icon(FontAwesome.arrow_down_solid, color: context.colors.primary),
        items: [
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text("Light", style: context.fonts.bodyLarge),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text("Dark", style: context.fonts.bodyLarge),
          ),
        ],
        onChanged: (value) {
          themeProvider.changeMode(value!);
        },
      ),
    );
  }
}
