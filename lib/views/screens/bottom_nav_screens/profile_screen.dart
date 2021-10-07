import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalVals.appbarColor,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 800,
            ),
            Positioned(
              top: 5.h,
              child: Container(
                width: 90.w,
                padding: EdgeInsets.all(2.h),
                margin: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.h),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Shuvojit Ghosh\n",
                            style: TextStyle(
                              color: GlobalVals.appbarColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "vertitect@gmail.com\n",
                            style: TextStyle(
                              color: GlobalVals.appbarColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          TextSpan(
                            text: "User ID: 29801\n",
                            style: TextStyle(
                              color: GlobalVals.appbarColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          TextSpan(
                            text: "Country: India",
                            style: TextStyle(
                              color: GlobalVals.appbarColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("Full Name"),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("Email"),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("Referral Code"),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("Date of Birth"),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("Phone"),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("Pin"),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("Country"),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("State"),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("City"),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("Post Code"),
                    SizedBox(
                      height: 2.h,
                    ),
                    _textFields("Address"),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                child: Center(
                  child: Stack(
                    children: [
                      Card(
                        elevation: 1.h,
                        shape: CircleBorder(
                          side: BorderSide(
                            width: 0.5.h,
                            color: Colors.white,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              5.h,
                            ),
                            child: Image.asset(
                              "assets/avatar.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          radius: 5.h,
                        ),
                      ),
                      Positioned(
                        bottom: 1.h,
                        right: 1.h,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(0.4.h),
                          child: Icon(
                            Icons.add_a_photo,
                            size: 2.h,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _textFields(String text) {
    return Container(
      height: 4.h,
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5.h,
            ),
            gapPadding: 1.0,
          ),
          hintText: text,
          focusColor: Colors.blue,
          contentPadding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 2.h,
          ),
        ),
      ),
    );
  }
}
