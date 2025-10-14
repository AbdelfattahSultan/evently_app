import 'package:evently_app/core/design/app_images.dart';

class Event {
  String? id;
  String? creatorUserId;
  String? category;
  String? image;
  String? title;
  String? description;
  DateTime? timeOfDay;
  DateTime? dateTime;

  Event({
    this.id,
    this.title,
    this.category,
    this.creatorUserId,
    this.timeOfDay,
    this.dateTime,
    this.image,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "category": category,
      "creatorUserId": creatorUserId,
      "image": image,
      "description": description,
      "timeOfDay": timeOfDay?.microsecondsSinceEpoch,
      "dateTime": dateTime?.microsecondsSinceEpoch,
    };
  }

  factory Event.fromMap(Map<String, dynamic>? map) {
    return Event(
      id: map?["id"],
      title: map?["title"],
      category: map?["category"],
      creatorUserId: map?["creatorUserId"],
      image: map?["image"],
      description: map?["description"],
      timeOfDay: DateTime.fromMicrosecondsSinceEpoch(map?["timeOfDay"]),
      dateTime: DateTime.fromMicrosecondsSinceEpoch(map?["dateTime"]),
    );
  }

  String getCategoryImage() {
    switch (category?.toLowerCase()) {
      case "sport":
        return AppImages.sport;
      case "birthday":
        return AppImages.birthday;
      case "eating":
        return AppImages.eating;
      case "gaming":
        return AppImages.gaming;
      case "book club":
        return AppImages.bookClub;
      case "holiday":
        return AppImages.holiday;
      case "meeting":
        return AppImages.meeting;
      case "work shop":
        return AppImages.workShop;
      default:
        return '';
    }
  }
}
