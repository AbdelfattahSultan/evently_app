import 'package:evently_app/db/EventDao.dart';
import 'package:evently_app/db/model/Event.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/screens/home/Tabs/homeTab/EventCard.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<Event> events = [
    Event(
      image: AppImages.eating,
      description: "Meeting for Updating The Development Method ",
      timeOfDay: DateTime.now(),
      dateTime: DateTime.now(),
    ),
    Event(
      image: AppImages.sport,
      description: "this is my fav sports ",
      timeOfDay: DateTime.now(),
      dateTime: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: EventDao.getEvents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("something went wrong"));
                }
                var events = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) =>
                      EventCard(eventModel: events![index]),
                  itemCount: events?.length??0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
