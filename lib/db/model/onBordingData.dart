import 'package:evently_app/core/design/app_images.dart';

class OnBoardingData {
  String title;
  String image;
  String description;

  OnBoardingData({
    required this.title,
    required this.description,
    required this.image,
  });

  static List<OnBoardingData> onBoardingList = [
    OnBoardingData(
      title: "Find Events That Inspire You",
      description:
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
      image: AppImages.intro1,
    ),
    OnBoardingData(
      title: "Effortless Event Planning",
      description:
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
      image: AppImages.intro2,
    ),
    OnBoardingData(
      title: "Connect with Friends & Share Moments",
      description:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
      image: AppImages.intro3,
    ),
  ];
}
