import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:flutter/material.dart';

class EventInfoTile extends StatelessWidget {
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String text;
  const EventInfoTile({
    super.key,
    required this.prefixIcon,
     this.suffixIcon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primary,
                  ),
                  child: Icon(prefixIcon, color: Colors.white),
                ),
                SizedBox(width: 8),
                Text(
                  overflow: TextOverflow.ellipsis,
                  text,
                  style: context.fonts.titleMedium?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Icon(suffixIcon, color: AppColors.primary),
        ],
      ),
    );
  }
}
