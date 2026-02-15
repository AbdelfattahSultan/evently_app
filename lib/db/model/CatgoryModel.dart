import 'package:evently_app/core/design/app_images.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CategoryModel {
  final String? title;
  final IconData? icon;
  final int? id;
  final String? image;

  const CategoryModel({this.id, this.image, this.title, this.icon});

  static List<CategoryModel> categoriesWithAll = [
    CategoryModel(title: "All", icon: FontAwesome.compass, id: 0, image: ""),
    CategoryModel(
      title: "Sport",
      icon: FontAwesome.bicycle_solid,
      id: 1,
      image: AppImages.sport,
    ),
    CategoryModel(
      title: "birthday",
      icon: Icons.celebration_outlined,
      id: 2,
      image: AppImages.birthday,
    ),
    CategoryModel(
      title: "Eating",
      icon: Icons.food_bank_rounded,
      id: 3,
      image: AppImages.eating,
    ),
    CategoryModel(
      title: "Gaming",
      icon: FontAwesome.playstation_brand,
      id: 4,
      image: AppImages.gaming,
    ),
    CategoryModel(
      title: "Book Club",
      icon: Icons.food_bank_rounded,
      id: 5,
      image: AppImages.bookClub,
    ),
    CategoryModel(
      title: "Holiday",
      icon: FontAwesome.umbrella_beach_solid,
      id: 6,
      image: AppImages.holiday,
    ),
    CategoryModel(
      title: "Meeting",
      icon: Icons.meeting_room,
      id: 7,
      image: AppImages.meeting,
    ),
    CategoryModel(
      title: "Work Shop",
      icon: Icons.construction,
      id: 8,
      image: AppImages.workShop,
    ),
  ];

  static List<CategoryModel> categories = [
    CategoryModel(
      title: "Sport",
      icon: FontAwesome.bicycle_solid,
      id: 1,
      image: AppImages.sport,
    ),
    CategoryModel(
      title: "birthday",
      icon: Icons.celebration_outlined,
      id: 2,
      image: AppImages.birthday,
    ),
    CategoryModel(
      title: "Eating",
      icon: Icons.food_bank_rounded,
      id: 3,
      image: AppImages.eating,
    ),
    CategoryModel(
      title: "Gaming",
      icon: FontAwesome.playstation_brand,
      id: 4,
      image: AppImages.gaming,
    ),
    CategoryModel(
      title: "Book Club",
      icon: Icons.food_bank_rounded,
      id: 5,
      image: AppImages.bookClub,
    ),
    CategoryModel(
      title: "Holiday",
      icon: FontAwesome.umbrella_beach_solid,
      id: 6,
      image: AppImages.holiday,
    ),
    CategoryModel(
      title: "Meeting",
      icon: Icons.meeting_room,
      id: 7,
      image: AppImages.meeting,
    ),
    CategoryModel(
      title: "Work Shop",
      icon: Icons.construction,
      id: 8,
      image: AppImages.workShop,
    ),
  ];
}
