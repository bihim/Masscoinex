import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:masscoinex/controllers/registration_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  final RegistrationController _registrationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: GlobalVals.appbarColor,
        bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            height: 0.1.h,
          ),
          preferredSize: Size.fromHeight(
            0.1.h,
          ),
        ),
      ),
      backgroundColor: GlobalVals.backgroundColor,
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Image.asset(
                  "assets/logo_white.png",
                  height: 12.h,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.h,
                    vertical: 3.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.h,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      3.h,
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 17.sp,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.1.h,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      _mobileNumber(),
                      SizedBox(
                        height: 2.h,
                      ),
                      _names(),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5.h,
                            ),
                            gapPadding: 1.0,
                          ),
                          hintText: "Email Address",
                          focusColor: Colors.blue,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 2.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      _password(),
                      SizedBox(
                        height: 2.h,
                      ),
                      _pins(),
                      SizedBox(
                        height: 2.h,
                      ),
                      _privacyPolicy(),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.h),
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
                              Get.toNamed(
                                  Routes.mobileVerificationRegistration);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: const Text("Continue"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _privacyPolicy() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Checkbox(
            value: _registrationController.isCheckedCondition.value,
            onChanged: (value) {
              _registrationController.isCheckedCondition.value = value!;
            },
          ),
        ),
        Expanded(
          flex: 7,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "I have understood the ",
                ),
                TextSpan(
                  text: "Terms of Use",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("Terms");
                    },
                ),
                TextSpan(
                  text: " and ",
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("Policy");
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _pins() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            maxLength: 4,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  5.h,
                ),
                gapPadding: 1.0,
              ),
              hintText: "Set 4 digit PIN",
              focusColor: Colors.blue,
              contentPadding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 2.h,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Expanded(
          flex: 1,
          child: TextField(
            maxLength: 4,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  5.h,
                ),
                gapPadding: 1.0,
              ),
              hintText: "Confirm 4 digit PIN",
              focusColor: Colors.blue,
              contentPadding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 2.h,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _password() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  5.h,
                ),
                gapPadding: 1.0,
              ),
              hintText: "Enter Password",
              focusColor: Colors.blue,
              contentPadding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 2.h,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Expanded(
          flex: 1,
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  5.h,
                ),
                gapPadding: 1.0,
              ),
              hintText: "Confirm Password",
              focusColor: Colors.blue,
              contentPadding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 2.h,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _names() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  5.h,
                ),
                gapPadding: 1.0,
              ),
              hintText: "First Name",
              focusColor: Colors.blue,
              contentPadding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 2.h,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Expanded(
          flex: 1,
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  5.h,
                ),
                gapPadding: 1.0,
              ),
              hintText: "Last Name",
              focusColor: Colors.blue,
              contentPadding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 2.h,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _mobileNumber() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(
          5.h,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: InternationalPhoneNumberInput(
          initialValue: PhoneNumber(isoCode: 'IN'),
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
          },
          onInputValidated: (bool value) {
            print(value);
          },
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
            setSelectorButtonAsPrefixIcon: true,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
          formatInput: false,
          keyboardType: TextInputType.numberWithOptions(
            signed: true,
            decimal: true,
          ),
          hintText: "Mobile Number",
          inputBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          onSaved: (PhoneNumber number) {
            print('On Saved: $number');
          },
        ),
      ),
    );
  }
}
