import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masscoinex/controllers/currency_selected_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/views/components/arc_clip.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CurrencySelectedScreen extends StatelessWidget {
  final CurrencySelectedController _currencySelectedController =
      Get.put(CurrencySelectedController());

  @override
  Widget build(BuildContext context) {
    var _visible = true.obs;
    final int _index = int.parse(Get.parameters["index"]!);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currencySelectedController
              .dashBoardCryptoStatusModels[_index].cryptoName,
        ),
        backgroundColor: GlobalVals.appbarColor,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              _animatedCurrencyProviderThings(_visible, _index),
              _topItems(_visible),
              SizedBox(
                height: 2.h,
              ),
              //?make the list here
            ],
          ),
        ),
      ),
    );
  }

  Padding _topItems(RxBool _visible) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Buy\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 17.sp,
                  ),
                ),
                TextSpan(
                  text: "INR 23850",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              if (_visible.value == true) {
                _visible.value = false;
              } else {
                _visible.value = true;
              }
            },
            icon: Icon(_visible.value == true
                ? Icons.arrow_drop_up
                : Icons.arrow_drop_down),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Sell\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: GlobalVals.backgroundColor,
                    fontSize: 17.sp,
                  ),
                ),
                TextSpan(
                  text: "INR 12333",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer _animatedCurrencyProviderThings(
      RxBool _visible, int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _visible.value == true ? 30.h : 0,
      width: double.infinity,
      child: ClipPath(
        clipper: ArcClipper(),
        child: Container(
          height: 30.h,
          color: GlobalVals.currencyColor,
          child: _visible.value == true
              ? _currencyProviderThings(index)
              : SizedBox(),
        ),
      ),
    );
  }

  Widget _currencyProviderThings(int index) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 10.h,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 3.h,
                  child: Container(
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 0.4.h,
                            shadowColor: Colors.grey.shade100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                4.h,
                              ),
                            ),
                            child: Container(
                              height: 5.h,
                              width: 5.h,
                              padding: EdgeInsets.all(1.h),
                              child: Image.asset(
                                _currencySelectedController
                                    .dashBoardCryptoStatusModels[index]
                                    .cryptoAsset,
                                fit: BoxFit.fill,
                                color: Colors.blue.shade600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "${_currencySelectedController.dashBoardCryptoStatusModels[index].cryptoName}    ",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
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
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            height: 15.h,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "0.670013\n\n",
                    style: TextStyle(
                      fontSize: 25.sp,
                    ),
                  ),
                  TextSpan(
                    text: "≈ \$23665.00\n",
                    style: TextStyle(
                      fontSize: 18.sp,
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
