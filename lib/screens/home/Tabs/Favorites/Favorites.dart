import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/common/CustomTabBar.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/db/EventDao.dart';
import 'package:evently_app/db/model/CatgoryModel.dart';
import 'package:evently_app/provider/AuthProvider.dart';

import 'package:evently_app/common/EventCard.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  // @override
  // void didUpdateWidget(covariant Favorites oldWidget) {
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
            color: Colors.transparent,
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
          child: FutureBuilder(
            future: EventDao.getFavoriteEvents(
              allCategories[selectedCategoryIndex].id != 0
                  ? allCategories[selectedCategoryIndex].id
                  : null,
              provider.getUser()?.favorites ?? [],
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
                padding: const EdgeInsets.all(12),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    var event = events[index];
                    var isFavorite = provider.isFavorite(event);
                    events[index].isFavorite = isFavorite;
                    return EventCard(eventModel: events[index]);
                  },
                  itemCount: events.length ?? 0,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
