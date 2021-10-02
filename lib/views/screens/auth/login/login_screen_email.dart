import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:masscoinex/controllers/login_controller_email.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:masscoinex/views/components/auth/login_no_account.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class LoginEmailScreen extends StatelessWidget {
  final LoginControllerEmail _loginControllereEmail =
      Get.put(LoginControllerEmail());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Email Credentials"),
        backgroundColor: GlobalVals.appbarColor,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 3.h,
            ),
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  const LoginNoAccount(),
                  Container(
                    width: double.infinity,
                    child: const Text(
                      "Masscoinex will send a verification code to your email.",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: double.infinity,
                    child: const Text(
                      "Please enter your email credentials",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: double.infinity,
                    child: TextField(
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
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            5.h,
                          ),
                          gapPadding: 1.0,
                        ),
                        hintText: "Password",
                        focusColor: Colors.blue,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 1.h,
                          horizontal: 2.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Checkbox(
                          value:
                              _loginControllereEmail.isCheckedCondition.value,
                          onChanged: (value) {
                            _loginControllereEmail.isCheckedCondition.value =
                                value!;
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
                              const TextSpan(
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
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
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
                        Get.toNamed(Routes.emailVerification);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: const Text("Proceed Securely"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Disclaimer\n",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                          ),
                        ),
                        TextSpan(
                          text:
                              "Trading in cryptocurrencies is subject to market, technical and legal risk",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
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
      ),
    );
  }
}
