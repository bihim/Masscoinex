import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:masscoinex/api/api_routes.dart';
import 'package:masscoinex/controllers/dashboard/currency_select/buy_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class BuyScreen extends StatelessWidget {
  final _logger = Logger();
  final int index;
  final _buyController = Get.put(BuyController());
  BuyScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buyController.index.value = index;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.h,
      ),
      child: Column(
        children: [
          _swap(),
          SizedBox(
            height: 3.h,
          ),
          _continue(),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }

  Widget _swap() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.h),
      ),
      elevation: 0.5.h,
      child: Container(
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Column(
          children: [
            _converter(),
            SizedBox(
              height: 3.h,
            ),
            _cryptoValueConvt(),
            /* Obx(
              () => _cryptoValueConvt(),
            ), */
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "(Fee 16.40 USD)",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            _denominated(),
          ],
        ),
      ),
    );
  }

  Column _denominated() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Receiving Crypto Value",
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          height: 6.h,
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(1.h),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: TextField(
            enabled: false,
            cursorColor: GlobalVals.appbarColor,
            controller: _buyController.denominatedValue,
            decoration: InputDecoration(
              hintText: "Denomitated Value",
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _cryptoValueConvt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Crypto Value",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(1.h),
                    bottomLeft: Radius.circular(1.h),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  cursorColor: GlobalVals.appbarColor,
                  controller: _buyController.cryptoValueController,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 2.h,
                      onPressed: () {
                        _buyController.getBuy(
                            _buyController.cryptoValueController.text,
                            "crypto_value",
                            ApiRoutes.getFiatCryptoAmount);
                      },
                      icon: Icon(
                        Icons.refresh,
                        size: 2.h,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Amount",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(1.h),
                    bottomRight: Radius.circular(1.h),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.end,
                  cursorColor: GlobalVals.appbarColor,
                  controller: _buyController.amountController,
                  decoration: InputDecoration(
                    suffix: Text(
                        "${_buyController.dashboardValue.wallet.currency}  "),
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 2.h,
                      onPressed: () {
                        _buyController.getBuy(
                            _buyController.amountController.text,
                            "crypto_amount",
                            ApiRoutes.getFiatCryptoValue);
                      },
                      icon: Icon(
                        Icons.refresh,
                        size: 2.h,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _converter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Crypto Currency",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(1.h),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 2.h, 7.h, 2.h),
                  child: Text(
                    _buyController.dashboardValue.cryptoData[index].coinName,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(top: 3.h),
            child: Icon(
              Icons.shuffle,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Selected Currency",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(1.h),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 2.h, 7.h, 2.h),
                  child: Text(
                    _buyController.selectedCurrency.value,
                  ),
                ),
              )
            ],
          ),
        ),
        /* Expanded(
          flex: 2,
          child: _dropDown(
            CrossAxisAlignment.end,
            "Select Currency",
            _dropdownValueTo,
            _dropDownValueToList,
          ),
        ), */
      ],
    );
  }

  Container _continue() {
    return Container(
      width: double.infinity,
      child: Obx(
        () => ElevatedButton(
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
            _buyController.buyCoin();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: _buyController.isBought.value == true
                ? const Text("Continue")
                : const CircularProgressIndicator(
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
