import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:masscoinex/controllers/add_account_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class AddAccountScreen extends StatelessWidget {
  final AddAccountController _addAccountController =
      Get.put(AddAccountController());
  @override
  Widget build(BuildContext context) {
    final TabBar _tabBar = TabBar(
      onTap: (index) {
        _addAccountController.currentIndex.value = index;
      },
      tabs: [
        Tab(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              children: [
                Icon(
                  Icons.account_balance,
                  color: GlobalVals.appbarColor,
                ),
                Text(
                  "Add Bank",
                  style: TextStyle(color: GlobalVals.appbarColor),
                ),
              ],
            ),
          ),
        ),
        Tab(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              children: [
                Icon(
                  Icons.credit_card,
                  color: GlobalVals.appbarColor,
                ),
                Text(
                  "Add Card",
                  style: TextStyle(color: GlobalVals.appbarColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
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
                preferredSize: _tabBar.preferredSize,
                child: ColoredBox(
                  color: Colors.white,
                  child: _tabBar,
                ),
              ),
            ),
            body: _tabBars(),
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
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(bottom: 1.h),
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
            ),
          );
        },
      ),
    );
  }

  Container _textFields(String hint) {
    return Container(
      width: double.infinity,
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5.h,
            ),
            gapPadding: 1.0,
          ),
          hintText: hint,
          focusColor: Colors.blue,
          contentPadding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 2.h,
          ),
        ),
      ),
    );
  }

  Widget _tabBars() {
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
          child: SingleChildScrollView(
            child: Column(
              children: _addAccountController.addCard,
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
