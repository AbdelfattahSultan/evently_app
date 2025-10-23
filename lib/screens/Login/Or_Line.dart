import 'package:evently_app/core/design/app_colors.dart';
import 'package:flutter/material.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: AppColors.primary,
            ),
          ),
          Text(
            "  Or  ",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primary,
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              width: double.infinity,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
