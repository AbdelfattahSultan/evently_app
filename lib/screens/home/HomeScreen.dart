import 'package:evently_app/Extensions/AppExtensions.dart';

import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/provider/AuthProvider.dart';
import 'package:evently_app/screens/home/Tabs/Favorites/Favorites.dart';

import 'package:evently_app/screens/home/Tabs/homeTab/HomeTab.dart';
import 'package:evently_app/screens/home/Tabs/map/Maps.dart';
import 'package:evently_app/screens/home/Tabs/profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentNavIndex = 0;

  late List<Widget> tabs;
  @override
  void initState() {
    super.initState();
    tabs = [HomeTab(), Maps(), Favorites(), Profile()];
  }

  @override
  Widget build(BuildContext context) {
    AppAuthProvider authProvider = Provider.of<AppAuthProvider>(context);
    final bool isHomeTab = currentNavIndex == 0 || currentNavIndex == 2;

    return Scaffold(
      appBar: isHomeTab
          ? AppBar(
              centerTitle: false,
              toolbarHeight: 130,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.directional(),
              ),
              // backgroundColor: context.colors.primary,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authProvider.getUser()?.name ?? "",
                    style: context.fonts.bodyMedium,
                  ),
                  Text(
                    "Welcome Back",
                    style: context.fonts.bodyMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.location),
                      SizedBox(width: 12),
                      Text(
                        "Cairo , Egypt",
                        style: context.fonts.titleMedium?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    authProvider.logOut();
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  icon: Icon(Icons.logout, color: AppColors.white),
                ),
              ],
            )
          : AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 0,
              elevation: 0,
            ),
      body: Column(children: [Expanded(child: tabs[currentNavIndex])]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentNavIndex,
        showSelectedLabels: true,
        elevation: 0,
        onTap: (index) {
          setState(() {
            currentNavIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.homeIcon),
            label: "home",
            activeIcon: SvgPicture.asset(AppImages.homeFill),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.location),
            label: "map",
            activeIcon: SvgPicture.asset(AppImages.mapFill),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.heart),
            label: "Love",
            activeIcon: SvgPicture.asset(AppImages.loveFill),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.person),
            label: "Profile",
            activeIcon: SvgPicture.asset(AppImages.personFil),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.createEvent);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(360),
          side: BorderSide(color: AppColors.white, width: 4),
        ),
        child: Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
