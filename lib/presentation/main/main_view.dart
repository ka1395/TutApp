import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'pages/home_page.dart';
import 'pages/notifications_page.dart';
import 'pages/search_page.dart';
import 'pages/settings_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    NotificationsPage(),
    SettingsPage()
  ];
 List<String> titles = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.notifications,
    AppStrings.settings,
  ];
   var _title =  AppStrings.home;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: Theme.of(context).textTheme.titleSmall),
      ),
      body: pages[_currentIndex],
       bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: ColorManager.lightGrey, spreadRadius: AppSize.s1)
        ]),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: AppStrings.home),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: AppStrings.search),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: AppStrings.notifications),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: AppStrings.settings),
          ],
        ),
      ),
    );
    
  }
  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}