import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;
  final int currentIndex;
  const TabBarItem({
    
    super.key,
    required this.title,
    required this.icon,
    required this.index,
    required this.currentIndex,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.white : Colors.transparent,
        border: Border.all(
          color: currentIndex == index ? Colors.transparent : Colors.white,
        ),
        borderRadius: BorderRadius.circular(46),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentIndex == index
                ? context.colors.primary
                : Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: currentIndex == index
                  ? context.colors.primary
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
