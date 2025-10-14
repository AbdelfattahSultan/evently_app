import 'package:evently_app/common/customTapItem.dart';

import 'package:evently_app/db/model/CatgoryModel.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<CategoryModel> categories;
  final Color selectedBgColor;
  final Color selectedFgColor;
  final Color unselectedBgColor;
  final Color unselectedFgColor;
  final void Function(CategoryModel category,int index)? onCategoryClick;

  const CustomTabBar({
    super.key,
    required this.categories,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unselectedBgColor,
    required this.unselectedFgColor,
    this.onCategoryClick
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        onTap: (index) {
          widget.onCategoryClick?.call(widget.categories[index],index,);
          setState(() {
            currentTabIndex = index;
          });
        },
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        tabs: widget.categories
            .map(
              (category) => CustomTapItem(
                category: category,
                isSelected:
                    currentTabIndex == widget.categories.indexOf(category),
                selectedBgColor: widget.selectedBgColor,
                selectedFgColor: widget.selectedFgColor,
                unselectedBgColor: widget.unselectedBgColor,
                unselectedFgColor: widget.unselectedFgColor,
              ),
            )
            .toList(),
      ),
    );
  }
}
