import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const ArrowButton({super.key, required this.onTap,required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(365),
          color: Colors.transparent,
          border: Border.all(color: context.colors.primary),
        ),
        child: Icon(icon),
      ),
    );
  }
}
