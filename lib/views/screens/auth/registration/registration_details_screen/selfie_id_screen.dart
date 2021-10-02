import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:masscoinex/controllers/registration_details_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'component/continue_button.dart';

class SelfieIdScreen extends StatelessWidget {
  final RegistrationDetailsController registrationDetailsController;
  const SelfieIdScreen({Key? key, required this.registrationDetailsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "Upload");
                },
                icon: Icon(
                  Icons.add_a_photo,
                  color: Colors.blue.shade600,
                  size: 4.h,
                ),
              ),
              Text("Upload selfie with ID proof"),
            ],
          ),
          ContinueButton(
            index: 1, registrationDetailsController: registrationDetailsController,
          ),
        ],
      ),
    );
  }
}
