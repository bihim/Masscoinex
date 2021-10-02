import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddAccountController extends GetxController {
  final currentIndex = 0.obs;
  final currentBankDetails = 1.obs;
  final currentCardDetails = 1.obs;
  final RxList<Column> addBank = [Column()].obs;
  final RxList<Column> addCard = [Column()].obs;
  @override
  void onInit() {
    addBank.add(_bankFields());
    addCard.add(_cardFields());
    super.onInit();
  }

  Column _bankFields() {
    return Column(
      children: [
        /* Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: GlobalVals.backgroundColor,
            borderRadius: BorderRadius.circular(2.h),
          ),
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text(
            "Bank details ${currentBankDetails.value.toString()}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ), */
        _textFields("Your full name as per bank record"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Full bank name"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Account Number"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Confirm Account Number"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("IFSC Code"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("MICR Code"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("UPI/VPA"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Branch Name"),
        SizedBox(
          height: 2.h,
        ),
        Container(
          width: double.infinity,
          height: 17.h,
          child: TextField(
            maxLines: 2,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  3.h,
                ),
                gapPadding: 1.0,
              ),
              hintText: "Branch Address",
              focusColor: Colors.blue,
              contentPadding: EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 5.h,
              ),
            ),
          ),
        ),
        _textFields("Branch City"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Branch Zip Code"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Branch Telephone"),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  Column _cardFields() {
    return Column(
      children: [
        /* Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: GlobalVals.backgroundColor,
            borderRadius: BorderRadius.circular(2.h),
          ),
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text(
            "Card details ${currentCardDetails.value.toString()}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ), */
        _textFields("Name on Card"),
        SizedBox(
          height: 2.h,
        ),
        Container(
          width: double.infinity,
          height: 17.h,
          child: TextField(
            maxLines: 2,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  3.h,
                ),
                gapPadding: 1.0,
              ),
              hintText: "Billing Address",
              focusColor: Colors.blue,
              contentPadding: EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 5.h,
              ),
            ),
          ),
        ),
        _textFields("City"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("State"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Post/Zip Code"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Telephone Number"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Country"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Card Number"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Card Type"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("Card Expiry"),
        SizedBox(
          height: 2.h,
        ),
        _textFields("CVV"),
        SizedBox(
          height: 8.h,
        ),
      ],
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
}
