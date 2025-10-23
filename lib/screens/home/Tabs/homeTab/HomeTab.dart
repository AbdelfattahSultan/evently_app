import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/common/CustomTabBar.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/db/EventDao.dart';
import 'package:evently_app/db/model/CatgoryModel.dart';
import 'package:evently_app/provider/AuthProvider.dart';

import 'package:evently_app/common/EventCard.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  //  @override
  // void didUpdateWidget(covariant HomeTab oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  //   if (widget.selectedCategory.id != oldWidget.selectedCategory.id) {
  //     setState(() {});
  //   }
  // }
  int selectedCategoryIndex = 0;

  List<CategoryModel> allCategories = CategoryModel.categoriesWithAll;
  @override
  Widget build(BuildContext context) {
    AppAuthProvider provider = Provider.of<AppAuthProvider>(
      context,
      listen: false,
    );
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(16),
              bottomStart: Radius.circular(16),
            ),
          ),
          child: CustomTabBar(
            categories: allCategories,
            
            onCategoryClick: (category, index) {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: EventDao.getRealTimeUpdateEvents(
              allCategories[selectedCategoryIndex].id != 0
                  ? allCategories[selectedCategoryIndex].id
                  : null,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("something went wrong"));
              }
              var events = snapshot.data;

              if (events == null || events.isEmpty == true) {
                return Center(
                  child: Center(
                    child: Text(
                      "No events found",
                      style: context.fonts.titleLarge?.copyWith(
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    var event = events[index];
                    var isFavorite = provider.isFavorite(event);
                    events[index].isFavorite = isFavorite;
                    return EventCard(eventModel: events[index]);
                  },
                  itemCount: events.length ,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
