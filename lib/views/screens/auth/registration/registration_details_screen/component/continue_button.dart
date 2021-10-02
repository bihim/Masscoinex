import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masscoinex/controllers/registration_details_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContinueButton extends StatelessWidget {
  final int index;
  final RegistrationDetailsController registrationDetailsController;
  const ContinueButton({
    Key? key,
    required this.index,
    required this.registrationDetailsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          if (registrationDetailsController.currentIndex.value == 0) {
            registrationDetailsController.currentIndex.value = 1;
            registrationDetailsController.previousIndex.value = 0;
          } else if (registrationDetailsController.currentIndex.value == 1 &&
              registrationDetailsController.previousIndex.value == 0) {
            registrationDetailsController.currentIndex.value = 2;
            registrationDetailsController.previousIndex.value = 1;
          } else if (registrationDetailsController.currentIndex.value == 2 &&
              registrationDetailsController.previousIndex.value == 1) {
            registrationDetailsController.currentIndex.value = 3;
            registrationDetailsController.previousIndex.value = 2;
          } else if (registrationDetailsController.currentIndex.value == 3 &&
              registrationDetailsController.previousIndex.value == 2) {
            Get.toNamed(Routes.kycUploadedScreen);
          }
          print(
              "current index: ${registrationDetailsController.currentIndex.value}");
          print(
              "previous index: ${registrationDetailsController.previousIndex.value}");
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: const Text("Continue"),
        ),
      ),
    );
  }
}
