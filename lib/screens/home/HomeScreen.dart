import 'package:evently_app/Extensions/AppExtensions.dart';
import 'package:evently_app/core/design/app_colors.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/provider/AuthProvider.dart';
import 'package:evently_app/common/Tab_bar_Item.dart';
import 'package:evently_app/screens/home/Tabs/Favorites/Favorites.dart';
import 'package:evently_app/screens/home/Tabs/homeTab/HomeTab.dart';
import 'package:evently_app/screens/home/Tabs/map/Maps.dart';
import 'package:evently_app/screens/home/Tabs/profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  int currentNavIndex = 0;

  List<Widget> tabs = [HomeTab(), Maps(), Favorites(), Profile()];
  @override
  Widget build(BuildContext context) {
    AppAuthProvider authProvider = Provider.of<AppAuthProvider>(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 174,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.directional(
              bottomStart: Radius.circular(24),
              bottomEnd: Radius.circular(24),
            ),
          ),
          backgroundColor: context.colors.primary,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authProvider.getUserName()?.name ?? "",
                style: context.fonts.bodyMedium?.copyWith(
                  color: AppColors.white,
                ),
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
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            tabs: [
              TabBarItem(
                title: "All",
                icon: FontAwesome.compass,
                index: 0,
                currentIndex: currentTabIndex,
              ),
              TabBarItem(
                title: "Sport",
                icon: FontAwesome.bicycle_solid,
                index: 1,
                currentIndex: currentTabIndex,
              ),
              TabBarItem(
                title: "Birthday",
                icon: FontAwesome.calendar_week_solid,
                index: 2,
                currentIndex: currentTabIndex,
              ),
              TabBarItem(
                title: "Gaming",
                icon: FontAwesome.playstation_brand,
                index: 3,
                currentIndex: currentTabIndex,
              ),
              TabBarItem(
                title: "workShop",
                icon: Icons.work_outline_sharp,
                index: 4,
                currentIndex: currentTabIndex,
              ),
            ],
          ),
        ),
      body: tabs[currentNavIndex],
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
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(360),
            side: BorderSide(color: AppColors.white, width: 4),
          ),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
