import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class BuyScreen extends StatelessWidget {
  final _dropdownValueFrom = 'BTC'.obs;
  final _dropdownValueTo = 'USD'.obs;
  final _dropDownValueFromList = ['BTC', 'RPL', 'EOS', 'ETH', 'ION'];
  final _dropDownValueToList = ['USD', 'IND', 'BDT', 'EURO', 'DIRHAM'];
  final TextEditingController _cryptoValueController =
      TextEditingController(text: "150000");
  final TextEditingController _toCryptoValueController =
      TextEditingController(text: "457800");
  final TextEditingController _denominatedValue =
      TextEditingController(text: "1.98");
  final String currentCurrencyText;
  BuyScreen({Key? key, required this.currentCurrencyText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Obx(
              () => _cryptoValueConvt(),
            ),
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
            "Crypto Value",
            _cryptoValueController,
            BorderRadius.only(
              topLeft: Radius.circular(1.h),
              bottomLeft: Radius.circular(1.h),
            ),
            Colors.grey.shade200,
            null,
            null,
          ),
        ),
        Expanded(
          flex: 2,
          child: _cryptoValue(
            CrossAxisAlignment.end,
            "Amount",
            _toCryptoValueController,
            BorderRadius.only(
              topRight: Radius.circular(1.h),
              bottomRight: Radius.circular(1.h),
            ),
            Colors.white,
            "Total",
            _dropdownValueTo.value,
          ),
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
      String? prefixText,
      String? suffixText) {
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
            textAlign: prefixText != null ? TextAlign.end : TextAlign.start,
            cursorColor: GlobalVals.appbarColor,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: "Enter Crypto Value",
              prefix: prefixText != null ? Text(prefixText) : SizedBox(),
              suffix: suffixText != null ? Text(suffixText) : SizedBox(),
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
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
          child: /* _dropDown(
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
            "Select Currency",
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
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(1.h),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: /* DropdownButton<String>(
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
            ) */
                Material(
              color: Colors.transparent,
              child: InkWell(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: 1.8.h,
                    horizontal: 2.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dropdownInitValue.value,
                        textAlign: TextAlign.start,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Get.defaultDialog(
                    title: "Select Crypto",
                    content: Container(
                      height: 35.h,
                      width: 100.h,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              dropdownList[index],
                            ),
                            onTap: () {
                              dropdownInitValue.value = dropdownList[index];
                              Get.back();
                            },
                          );
                        },
                        itemCount: dropdownList.length,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
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
}
