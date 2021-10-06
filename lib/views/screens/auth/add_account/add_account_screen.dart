import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:masscoinex/controllers/add_account_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:masscoinex/views/screens/auth/add_account/add_card/card_fields_screen.dart';
import 'package:masscoinex/views/screens/auth/add_account/add_card/card_picture_screen.dart';
import 'package:masscoinex/views/screens/auth/add_account/add_card/card_video_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class AddAccountScreen extends StatelessWidget {
  final AddAccountController _addAccountController =
      Get.put(AddAccountController());
  @override
  Widget build(BuildContext context) {
    final _cardScreens = [
      CardFieldsScreen(
        addAccountController: _addAccountController,
      ),
      CardPictureScreen(
        addAccountController: _addAccountController,
      ),
      CardVideoScreen(
        addAccountController: _addAccountController,
      ),
    ];
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            _addAccountController.currentIndex.value = tabController.index;
            print("New tab index: ${tabController.index}");
          });
          return Scaffold(
            appBar: AppBar(
              title: Text("Add Account"),
              backgroundColor: GlobalVals.appbarColor,
              bottom: PreferredSize(
                preferredSize: _addAccountController.size,
                child: ColoredBox(
                  color: Colors.white,
                  child: _addAccountController.tabBar,
                ),
              ),
            ),
            body: _tabBars(_cardScreens),
            /* floatingActionButton: GetX<AddAccountController>(
              init: AddAccountController(),
              builder: (val) {
                return FloatingActionButton.extended(
                  icon: Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    if (val.currentIndex.value == 0) {
                      val.currentBankDetails.value++;
                      val.addBank.add(_bankFields());
                      Fluttertoast.showToast(msg: "Added Extra Bank Fields");
                    } else {
                      val.currentCardDetails.value++;
                      val.addCard.add(_cardFields());
                      Fluttertoast.showToast(msg: "Added Extra Card Fields");
                    }
                  },
                  label: Text(
                    val.currentIndex.value == 0 ? "Add Bank" : "Add Card",
                  ),
                );
              },
            ), */
            /* bottomNavigationBar: Padding(
              padding: EdgeInsets.only(bottom: 1.h, left: 1.h, right: 1.h),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      GlobalVals.buttonColor,
                    ),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          5.h,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.addAccountSuccessful);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: const Text("Continue"),
                  ),
                ),
              ),
            ), */
          );
        },
      ),
    );
  }

  Widget _tabBars(var cardScreens) {
    return TabBarView(
      children: [
        Padding(
          padding: EdgeInsets.all(2.h),
          child: SingleChildScrollView(
            child: Column(
              children: _addAccountController.addBank,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.h),
          child: Obx(
            () => IndexedStack(
              children: cardScreens,
              index: _addAccountController.cardScreenIndex.value,
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabBarWithGetx() {
    return TabBarView(
      children: [
        GetX<AddAccountController>(
          init: AddAccountController(),
          builder: (val) {
            return Padding(
              padding: EdgeInsets.all(2.h),
              child: SingleChildScrollView(
                child: Column(
                  children: val.addBank,
                ),
              ),
            );
          },
        ),
        GetX<AddAccountController>(
          init: AddAccountController(),
          builder: (val) {
            return Padding(
              padding: EdgeInsets.all(2.h),
              child: SingleChildScrollView(
                child: Column(
                  children: val.addCard,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
