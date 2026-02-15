import 'package:evently_app/common/customTapItem.dart';
import 'package:evently_app/core/design/app_colors.dart';

import 'package:evently_app/db/model/CatgoryModel.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTabBar extends StatefulWidget {
  final List<CategoryModel> categories;

  final void Function(CategoryModel category, int index)? onCategoryClick;

  const CustomTabBar({
    super.key,
    required this.categories,

    this.onCategoryClick,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final selectedBgColor =provider.isDarkMode()?AppColors.primary: colorScheme.primary;
    final selectedFgColor = colorScheme.onPrimary;
    final unselectedBgColor = colorScheme.surface;
    final unselectedFgColor = colorScheme.onSurface.withOpacity(0.7);
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        onTap: (index) {
          widget.onCategoryClick?.call(widget.categories[index], index);
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
                selectedBgColor: selectedBgColor,
                selectedFgColor: selectedFgColor,
                unselectedBgColor: unselectedBgColor,
                unselectedFgColor: unselectedFgColor,
              ),
            )
            .toList(),
      ),
    );
  }
}
