
import 'package:evently_app/db/model/CatgoryModel.dart';
import 'package:flutter/material.dart';

typedef OnClick = Function(int index);

class CustomTapItem extends StatelessWidget {
  CategoryModel category;
  bool isSelected;
  final Color selectedBgColor;
  final Color selectedFgColor;
  final Color unselectedBgColor;
  final Color unselectedFgColor;
  

  CustomTapItem({
    super.key,
    required this.isSelected,
    required this.category,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unselectedBgColor,
    required this.unselectedFgColor,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? selectedBgColor : unselectedBgColor,
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(46)),
        border: Border.all(
          color: isSelected ? selectedFgColor : unselectedFgColor,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            category.icon,
            color: isSelected ? selectedFgColor : unselectedFgColor,
          ),
          const SizedBox(width: 10),
          Text(
            category.title ?? "",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isSelected ? selectedFgColor : unselectedFgColor,
            ),
          ),
        ],
      ),
    );
  }
}
