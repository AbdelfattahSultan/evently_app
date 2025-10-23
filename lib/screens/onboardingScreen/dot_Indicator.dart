import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DotIndicator extends StatelessWidget {
  bool isSelected;
  DotIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: isSelected ? 21 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.primary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(365),
      ),
      
    );
  }
}
