import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UPIPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPI Payment"),
        backgroundColor: GlobalVals.appbarColor,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Image.asset(
                "assets/upi.jpg",
                height: 10.h,
                width: 30.w,
              ),
              Image.asset(
                "assets/barcode.jpg",
                height: 15.h,
                width: 30.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "masscoinex@upi",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "copy",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Reference no: 000679",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "copy",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
              Text(
                "Scan & pay",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 71.w,
                height: 0.1.h,
                color: Colors.black,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Add your UPI transaction reference no below not the avobe displayed",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.all(3.h),
                height: 4.h,
                width: double.infinity,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        5.h,
                      ),
                      gapPadding: 1.0,
                    ),
                    hintText: "Enter the reference number",
                    focusColor: Colors.blue,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 2.h,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _continue("Continue", () {}),
    );
  }

  Container _continue(String text, VoidCallback voidCallback) {
    return Container(
      padding: EdgeInsets.all(3.h),
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
        onPressed: voidCallback,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text(text),
        ),
      ),
    );
  }
}
