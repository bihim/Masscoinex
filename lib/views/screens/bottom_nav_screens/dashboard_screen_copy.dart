import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:masscoinex/controllers/dashboard_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardScreenCopy extends StatelessWidget {
  final DashBoardController _dashBoardController =
      Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          color: GlobalVals.backgroundColor,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "Balance",
                          style: TextStyle(
                              color: GlobalVals.backgroundColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "45800 INR",
                      style: TextStyle(
                        color: GlobalVals.backgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buttonDepoWithdraw(GlobalVals.appbarColor,
                        Icons.arrow_downward, "Deposit"),
                    _buttonDepoWithdraw(
                        GlobalVals.appbarColor, Icons.arrow_upward, "Withdraw"),
                    _buttonDepoWithdraw(Colors.red, Icons.history, "History"),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Divider(
                height: 1.h,
                color: Colors.grey,
              ),
            ],
          ),
          ListView.separated(
            itemBuilder: (context, index) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Card(
                                elevation: 0.4.h,
                                shadowColor: Colors.grey.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    5.h,
                                  ),
                                ),
                                child: Container(
                                  height: 6.h,
                                  width: 6.h,
                                  padding: EdgeInsets.all(1.5.h),
                                  child: Image.asset(
                                    _dashBoardController
                                        .dashBoardCryptoStatusModels[index]
                                        .cryptoAsset,
                                    fit: BoxFit.fill,
                                    color: Colors.blue.shade600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: _dashBoardController
                                          .dashBoardCryptoStatusModels[index]
                                          .cryptoName,
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "  (${_dashBoardController.dashBoardCryptoStatusModels[index].cryptoNameSmall})" +
                                              "\n",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: _dashBoardController
                                          .dashBoardCryptoStatusModels[index]
                                          .cryptoPrice,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                          _dashBoardController
                                              .dashBoardCryptoStatusModels[
                                                  index]
                                              .priceColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: _dashBoardController
                                              .dashBoardCryptoStatusModels[
                                                  index]
                                              .cryptoPriceDollarBuy +
                                          "\n",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Buy",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                          GlobalVals.raiseColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: _dashBoardController
                                              .dashBoardCryptoStatusModels[
                                                  index]
                                              .cryptoPriceDollarSell +
                                          "\n",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Sell",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                          GlobalVals.raiseColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    //Get.toNamed(Routes.loginScreen);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1.h,
                color: Colors.grey,
              );
            },
            itemCount: _dashBoardController.dashBoardCryptoStatusModels.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          )
        ],
      ),
    );
  }

  ElevatedButton _buttonDepoWithdraw(
      Color color, IconData iconData, String buttonText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2.h,
        minimumSize: Size.zero, // <-- Add this
        padding: EdgeInsets.zero,
        primary: color,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(2.h),
        ),
      ),
      onPressed: () {
        Fluttertoast.showToast(
                        msg: buttonText);
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 1.5.h, right: 1.5.h, top: 0.5.h, bottom: 0.5.h),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 2.h,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}
