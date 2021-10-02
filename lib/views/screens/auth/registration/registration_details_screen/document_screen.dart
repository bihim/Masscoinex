import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:masscoinex/controllers/document_controller.dart';
import 'package:masscoinex/controllers/registration_details_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

import 'component/continue_button.dart';

class DocumentScreen extends StatelessWidget {
  final DocumentController _documentController = Get.find();
  final RegistrationDetailsController registrationDetailsController;

  DocumentScreen({Key? key, required this.registrationDetailsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(2.h),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _dropDown(),
                SizedBox(
                  height: 2.h,
                ),
                _text(),
                SizedBox(
                  height: 5.h,
                ),
                _upload(),
                SizedBox(
                  height: 1.h,
                ),
                Text("Upload front side"),
                SizedBox(
                  height: 10.h,
                ),
                _upload(),
                SizedBox(
                  height: 1.h,
                ),
                Text("Upload back side"),
              ],
            ),
            ContinueButton(index: 0,registrationDetailsController: registrationDetailsController,),
          ],
        ),
      ),
    );
  }

  Material _upload() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(5.h),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 0.1.h,
              color: Colors.grey,
            ),
          ),
          padding: EdgeInsets.all(2.h),
          child: Icon(
            Icons.add,
            color: Colors.blue.shade600,
          ),
        ),
        onTap: () {
          Fluttertoast.showToast(msg: "Upload");
        },
      ),
    );
  }

  Container _text() {
    return Container(
      width: double.infinity,
      child: Text(
        "Please upload any ID Document from the list",
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Container _dropDown() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(
          5.h,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: SizedBox(),
        value: _documentController.dropdownValue.value,
        onChanged: (String? newValue) {
          _documentController.dropdownValue.value = newValue!;
          //print(registrationDetailsController.currentIndex.value);
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
