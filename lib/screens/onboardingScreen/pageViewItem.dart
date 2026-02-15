import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/db/model/onBordingData.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final OnBoardingData data;
  const PageViewItem({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(data.image),
        SizedBox(height: 39),
        Text(
          data.title,
          style: context.fonts.bodyLarge,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 30),
        Expanded(
          child: Text(data.description, style: context.fonts.titleMedium),
        ),
      ],
    );
  }
}
