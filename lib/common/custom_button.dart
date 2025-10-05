import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String content;

  VoidCallback onTap;
  CustomButton({super.key, required this.onTap, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 16
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
          
        ),
        child: Text(
          content,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
