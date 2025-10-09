import 'package:evently_app/db/Event.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/screens/home/Tabs/homeTab/EventCard.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<Event> events = [
    Event(
      month: "nov",
      day: "22",
      image: AppImages.eating,
      description: "Meeting for Updating The Development Method ",
    ),
      Event(
      month: "jun",
      day: "1",
      image: AppImages.sport,
      description: "this is my fav sports ",
      
      
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return EventCard(eventModel: events[index]);
              },
              itemCount: events.length,
            ),
          ),
        ],
      ),
    );
  }
}
