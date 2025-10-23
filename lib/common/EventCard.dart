import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/db/UserDao.dart';
import 'package:evently_app/db/model/Event.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/provider/AuthProvider.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventCard extends StatefulWidget {
  final Event eventModel;
  const EventCard({super.key, required this.eventModel});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary, width: 2),
        image: DecorationImage(
          image: AssetImage(widget.eventModel.getCategoryImage()),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: provider.isDarkMode()
                  ? Theme.of(context).colorScheme.primary
                  : AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.eventModel.dateTime!.day.toString(),
                  style: context.fonts.titleSmall?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  widget.eventModel.dateTime!.viewMonthName,
                  style: context.fonts.titleSmall?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: provider.isDarkMode()
                  ? AppColors.darkPrimary
                  : Colors.white,
            ),
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.eventModel.description ?? "",

                    style: context.fonts.bodyMedium?.copyWith(
                      color: provider.isDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () {
                    toggleFavorite(widget.eventModel);
                  },
                  icon: widget.eventModel.isFavorite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void toggleFavorite(Event event) async {
    AppAuthProvider provider = Provider.of<AppAuthProvider>(
      context,
      listen: false,
    );

    var user = provider.getUser();
    var isFavorite = provider.isFavorite(event);
    if (isFavorite) {
      user = await UserDao.removeFavorite(event.id!, provider.getUser()!);
    } else {
      user = await UserDao.addToFavorite(event.id!, provider.getUser()!);
    }
    setState(() {
      event.isFavorite = !isFavorite;
    });
    provider.updateFavorites(user.favorites!);
  }
}
