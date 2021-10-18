import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class DashboardDepositScreen extends StatelessWidget {
  final _dropdownValueFrom = '40000'.obs;
  final _dropdownValueTo = 'USD'.obs;
  final _dropDownValueFromList = ['40000', '30000', '20000', '10000', '5000'];
  final _dropDownValueToList = ['USD', 'INR', 'BDT', 'RMB'];
  final TextEditingController _cryptoValueController =
      TextEditingController(text: "1");
  final TextEditingController _amountController =
      TextEditingController(text: "1634568");
  final TextEditingController _denominatedValue =
      TextEditingController(text: "42000");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVals.appbarColor,
        title: Text(
          "Deposit",
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 3.h,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            _converter(),
            SizedBox(
              height: 2.h,
            ),
            _cryptoValueConvt(),
            SizedBox(
              height: 2.h,
            ),
            _denominated(),
            SizedBox(
              height: 2.h,
            ),
            _buttons(),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttons() {
    return _continue(
      "Continue",
      () => Get.toNamed(Routes.modeOfPayment),
    );
  }

  Container _continue(String text, VoidCallback voidCallback) {
    return Container(
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
            cursorColor: GlobalVals.appbarColor,
            controller: _denominatedValue,
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
          flex: 1,
          child: _cryptoValue(
              CrossAxisAlignment.start,
              "Transaction Rate",
              _cryptoValueController,
              BorderRadius.circular(1.h),
              Colors.grey.shade200,
              TextAlign.start,
              null,
              "%"),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          flex: 1,
          child: _cryptoValue(
              CrossAxisAlignment.end,
              "Transaction Fee",
              _amountController,
              BorderRadius.circular(1.h),
              Colors.grey.shade200,
              TextAlign.end,
              "INR",
              null),
        ),
      ],
    );
  }

  Column _cryptoValue(
      CrossAxisAlignment crossAxisAlignment,
      String text,
      TextEditingController textEditingController,
      BorderRadius borderRadius,
      Color color,
      TextAlign textAlign,
      String? prefixText,
      String? suffixTest) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          text,
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
            color: color,
            borderRadius: borderRadius,
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: TextField(
            textAlign: textAlign,
            cursorColor: GlobalVals.appbarColor,
            controller: textEditingController,
            decoration: InputDecoration(
              prefix: prefixText != null ? Text(prefixText) : SizedBox(),
              suffix: suffixTest != null ? Text(suffixTest) : SizedBox(),
              hintText: "Enter Crypto Value",
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _converter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: _dropDown(
            CrossAxisAlignment.start,
            "Amount to Deposit",
            _dropdownValueFrom,
            _dropDownValueFromList,
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
          child: _dropDown(
            CrossAxisAlignment.end,
            "Currency",
            _dropdownValueTo,
            _dropDownValueToList,
          ),
        ),
      ],
    );
  }

  Widget _dropDown(CrossAxisAlignment crossAxisAlignment, String text,
      RxString dropdownInitValue, List<String> dropdownList) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(1.h),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: DropdownButton<String>(
              value: dropdownInitValue.value,
              elevation: 16,
              isDense: false,
              isExpanded: true,
              underline: Container(
                color: Colors.transparent,
              ),
              style: TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                dropdownInitValue.value = newValue!;
              },
              items: dropdownList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
