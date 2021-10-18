import 'package:flutter/material.dart';
import 'package:masscoinex/controllers/verify_registration_details_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:masscoinex/global/global_vals.dart';

class VerifyRegistrationDetailsScreen extends StatelessWidget {
  final VerifyRegistrationDetailsController _registrationDetailsController = Get.put(VerifyRegistrationDetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Registration"),
          backgroundColor: GlobalVals.appbarColor,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _topBarItems(Icons.credit_card_outlined,
                              Icons.credit_card, "ID Document", 0),
                          _divider(),
                          _topBarItems(Icons.badge_outlined, Icons.badge,
                              "Selfie with ID", 1),
                          _divider(),
                          _topBarItems(Icons.camera_front_outlined,
                              Icons.camera_front, "Selfie", 2),
                          _divider(),
                          _topBarItems(Icons.account_box_outlined,
                              Icons.account_box, "Declaration", 3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: IntrinsicHeight(
                  child: IndexedStack(
                    index: _registrationDetailsController.currentIndex.value,
                    children: _registrationDetailsController
                        .screens(_registrationDetailsController),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _divider() {
    return Text(
      "------",
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget _topBarItems(
    IconData iconData,
    IconData activeIconData,
    String buttonText,
    int indexNumber,
  ) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 700,
      ),
      width: indexNumber == _registrationDetailsController.currentIndex.value
          ? 14.h
          : 12.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              _registrationDetailsController.currentIndex.value = indexNumber;
              if (indexNumber != 0) {
                _registrationDetailsController.previousIndex.value =
                    indexNumber - 1;
              }
              else{
                _registrationDetailsController.previousIndex.value =
                    0;
              }
            },
            icon: Icon(
              indexNumber == _registrationDetailsController.currentIndex.value
                  ? activeIconData
                  : iconData,
              color: indexNumber ==
                      _registrationDetailsController.currentIndex.value
                  ? Colors.blue.shade600
                  : Colors.grey,
              size: indexNumber ==
                      _registrationDetailsController.currentIndex.value
                  ? 4.h
                  : 3.h,
            ),
          ),
          Text(
            buttonText,
            style: TextStyle(
              color: indexNumber ==
                      _registrationDetailsController.currentIndex.value
                  ? GlobalVals.backgroundColor
                  : Colors.grey,
              /* fontWeight: indexNumber ==
                      _registrationDetailsController.currentIndex.value
                  ? FontWeight.bold
                  : FontWeight.normal, */
            ),
          )
        ],
      ),
    );
  }
}
