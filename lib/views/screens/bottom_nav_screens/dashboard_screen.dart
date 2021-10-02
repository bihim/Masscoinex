import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masscoinex/controllers/dashboard_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:masscoinex/views/components/bottom_nav/dashboard_login_top.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardScreen extends StatelessWidget {
  final DashBoardController _dashBoardController =
      Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DashboardLoginTop(),
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
                    Get.toNamed(Routes.loginScreen);
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
}
