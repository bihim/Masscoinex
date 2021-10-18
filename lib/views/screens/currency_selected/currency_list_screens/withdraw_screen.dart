import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class WithdrawScreen extends StatelessWidget {
  final _dropdownValueFrom = 'BTC'.obs;
  final _dropDownValueFromList = ['BTC', 'RPL', 'EOS', 'ETH', 'ION'];
  final _textEditingController = TextEditingController(text: "test@mail.com");
  final TextEditingController _cryptoValueController =
      TextEditingController(text: "1");
  final TextEditingController _amountController =
      TextEditingController(text: "1634568");
  final TextEditingController _transactionFeesController =
      TextEditingController(text: "1200");
  final TextEditingController _receivingCryptoController =
      TextEditingController(text: "1634568");
  final String currentCurrencyText;
  WithdrawScreen({Key? key, required this.currentCurrencyText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.h,
      ),
      child: Column(
        children: [
          Card(
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
                  /* _dropDown(
                    CrossAxisAlignment.start,
                    "Crypto Currency",
                    _dropdownValueFrom,
                    _dropDownValueFromList,
                  ) */
                  Column(
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
                        width: double.infinity,
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
                            currentCurrencyText,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  _cryptoValueConvt(),
                  SizedBox(
                    height: 3.h,
                  ),
                  _cryptoValueConvt2(),
                  SizedBox(
                    height: 3.h,
                  ),
                  _walletAddress()
                ],
              ),
            ),
          ),
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

  Container _continue() {
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
        onPressed: () {
          //
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: const Text("Continue"),
        ),
      ),
    );
  }

  Column _walletAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter Wallet Address",
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
            controller: _textEditingController,
            decoration: InputDecoration(
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

  Row _cryptoValueConvt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: _cryptoValue(
              CrossAxisAlignment.start,
              "Crypto Value",
              _cryptoValueController,
              BorderRadius.circular(1.h),
              Colors.grey.shade200,
              TextAlign.start,
              null),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          flex: 1,
          child: _cryptoValue(
              CrossAxisAlignment.end,
              "Amount",
              _amountController,
              BorderRadius.circular(1.h),
              Colors.grey.shade200,
              TextAlign.end,
              "INR"),
        ),
      ],
    );
  }

  Row _cryptoValueConvt2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: _cryptoValue(
              CrossAxisAlignment.start,
              "Transaction Fees",
              _transactionFeesController,
              BorderRadius.circular(1.h),
              Colors.grey.shade200,
              TextAlign.start,
              null),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          flex: 1,
          child: _cryptoValue(
              CrossAxisAlignment.end,
              "Receiving Crypto",
              _receivingCryptoController,
              BorderRadius.circular(1.h),
              Colors.grey.shade200,
              TextAlign.end,
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
      String? prefixText) {
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
}
