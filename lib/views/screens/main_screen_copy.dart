import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masscoinex/controllers/main_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreenCopy extends StatelessWidget {
  final MainController _mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo_white.png",
                height: 4.h,
                width: 15.w,
              ),
            ],
          ),
          bottom: PreferredSize(
            child: Container(
              color: Colors.white,
              height: 0.1.h,
            ),
            preferredSize: Size.fromHeight(
              0.1.h,
            ),
          ),
          backgroundColor: GlobalVals.appbarColor,
          actions: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 2.h,
              child: Icon(
                Icons.person,
                color: GlobalVals.appbarColor,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
          ],
        ),
        drawer: Drawer(),
        body: IndexedStack(
          children: _mainController.screensCopy,
          index: _mainController.bottomIndex.value,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: GlobalVals.backgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: GlobalVals.bottomNavSelectedColor,
          ),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          items: _mainController.bottomNavItems,
          onTap: (index) {
            _mainController.bottomIndex.value = index;
          },
          currentIndex: _mainController.bottomIndex.value,
        ),
      ),
    );
  }
}
