import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:tourapp/const/app_strings.dart';
import 'package:tourapp/views/widgets/pages/nav_add.dart';
import 'package:tourapp/views/widgets/pages/nav_favourite.dart';
import 'package:tourapp/views/widgets/pages/nav_home.dart';

class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  RxInt _currentIndex = 0.obs;
  RxBool _drawer = false.obs;
  final _pages = [
    NavHome(),
    NavAdd(),
    NavFavourite(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
      top: _drawer.value == false ? 0 : 100.h,
      bottom: _drawer.value == false ? 0 : 100.h,
      left: _drawer.value == false ? 0 : 200.w,
      right: _drawer.value == false ? 0 : -100.w,
      duration: Duration(milliseconds: 400),


      child: Container(
        decoration: BoxDecoration(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading:_drawer.value==false? IconButton(
              //Drawer button............................................
              onPressed: () {
                 _drawer.value=true;
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ): IconButton(
              //Close button............................................
              onPressed: () {
                 _drawer.value=false;
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            title: Text(
              AppStrings.appName,
              style: TextStyle(color: Colors.black),
            ),
          ),

          //BottomNav...........................................................
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => _currentIndex.value = value,
            currentIndex: _currentIndex.value,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: 'Add'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'Favorite'),
            ],
          ),
          //Body....................................................
          body: _pages[_currentIndex.value],
        ),
      ),
    ));
  }
}
