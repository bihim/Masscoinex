import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:masscoinex/controllers/fiat/fiat_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/models/dashboard_model.dart';
import 'package:masscoinex/views/screens/bottom_nav_screens/fiat_screens/fiat_details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

import '../fiat_deposit_screen.dart';
import '../fiat_withdraw_screen.dart';

class FiatWalletScreen extends StatelessWidget {
  final _fiatController = Get.put(FiatController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: ()async{
          _fiatController.fiatHistory("");
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*_fiatBalance(),*/
              Obx(
                () => SizedBox(
                  child: _fiatController.responseResult.value == ""
                      ? const CircularProgressIndicator(
                          color: Colors.deepPurple,
                        )
                      : _balanceText(),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Obx(
                () => IndexedStack(
                  children: [
                    FiatDetailsScreen(
                      fiatController: _fiatController,
                    ),
                    FiatDepositScreen(
                      controller: _fiatController,
                    ),
                    FiatWithdrawScreen(
                      controller: _fiatController,
                    ),
                  ],
                  index: _fiatController.fiatIndex.value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _fiatBalance() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 3.h,
      ),
      height: 25.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.h),
        color: GlobalVals.appbarColor,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -20,
            right: 0,
            child: Icon(
              Icons.account_balance_wallet,
              size: 15.h,
              color: Colors.black12,
            ),
          ),
          Positioned(
            top: 5.h,
            left: 3.h,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "FIAT BALANCE\n\n\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19.sp,
                    ),
                  ),
                  TextSpan(
                    text: "Total Balance\n",
                    style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  TextSpan(
                    text: "INR 230000",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _balanceText() {
    var _result = DashboardModel.fromJson(
        json.decode(_fiatController.responseResult.value));
    var _currency = _result.wallet.currency ?? "";
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 3.h,
      ),
      height: 25.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.h),
        color: GlobalVals.appbarColor,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -20,
            right: 0,
            child: Icon(
              Icons.account_balance_wallet,
              size: 15.h,
              color: Colors.black12,
            ),
          ),
          Positioned(
            top: 5.h,
            left: 3.h,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "FIAT BALANCE\n\n\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19.sp,
                    ),
                  ),
                  TextSpan(
                    text: "Total Balance\n",
                    style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  TextSpan(
                    text: "$_currency ${_result.wallet.amount.toString()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
