import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class ModeOfPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mode of Payment"),
        backgroundColor: GlobalVals.appbarColor,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 3.h),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.credit_card_outlined,
                color: Colors.grey,
                size: 5.h,
              ),
              onTap: () {
                Get.toNamed(Routes.cardPayment);
              },
              title: Text(
                "Credit/Debit Card",
              ),
              subtitle: Text(
                "Pay using your Debit or Credit Card",
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_outlined,
                color: Colors.grey,
                size: 5.h,
              ),
              onTap: () {
                Get.toNamed(Routes.bankPayment);
              },
              title: Text(
                "Bank Transfer",
              ),
              subtitle: Text(
                "Pay through Net Banking",
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.credit_score_outlined,
                color: Colors.grey,
                size: 5.h,
              ),
              onTap: () {
                Get.toNamed(Routes.upiPayment);
              },
              title: Text(
                "UPI Payment",
              ),
              subtitle: Text(
                "Pay using your UPI ID",
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.grey,
                size: 5.h,
              ),
              onTap: () {},
              title: Text(
                "Wallet",
              ),
              subtitle: Text(
                "Pay using Paytm/PhonePe/Amazon Pay & more",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
