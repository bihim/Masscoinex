import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/models/bank_transfer_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class BankTransferScreen extends StatelessWidget {
  final _bankName = "".obs;
  final _bankAddress = "".obs;
  final _accountNo = "".obs;
  final _bankSwift = "".obs;
  final _name = "".obs;
  final _address = "".obs;
  final _referenceNumber = "".obs;
  final _bankDropDownList = [
    BankTransferModel(
        id: 1,
        bankName: "United Bank India",
        bankAddress: "33B Subhash Road, Kolkata",
        accountNo: "656 656 6565 656",
        bankSwift: "UIBKEJOAK",
        name: "Arjun Kumar",
        address: "Shivabpur London 4584V",
        referenceNumber: "21212151"),
    BankTransferModel(
        id: 2,
        bankName: "SBC Bank India",
        bankAddress: "33B Subhash Road, Kolkata",
        accountNo: "656 656 6565 656",
        bankSwift: "UIBKEJOAK",
        name: "Arjun Roy",
        address: "Shivabpur London 4584V",
        referenceNumber: "21212151"),
    BankTransferModel(
        id: 3,
        bankName: "IFIC Bank India",
        bankAddress: "33B Subhash Road, Kolkata",
        accountNo: "656 656 6565 656",
        bankSwift: "UIBKEJOAK",
        name: "Arjun Chandra",
        address: "Shivabpur London 4584V",
        referenceNumber: "21212151"),
  ];
  final _bankDropDown = "United Bank India".obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank Transfer"),
        backgroundColor: GlobalVals.appbarColor,
      ),
      body: Container(
        margin: EdgeInsets.all(2.h),
        child: Column(
          children: [
            Text(
              "Make sure you have the correct bank accounts linked",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Obx(() => _bankdropdown()),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h),
                border: Border.all(
                  width: 0.1.h,
                  color: Colors.grey.shade800,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => _bankNames("Bank Name", _bankName)),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() =>
                      _bankNames("Bank Address", _bankAddress)),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => _bankNames("Account No", _accountNo)),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => _bankNames("Bank Swift", _bankSwift)),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => _bankNames("Name", _name)),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => _bankNames("Address", _address)),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => _bankNames("Reference Number", _referenceNumber)),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _continue("Continue", () {}),
    );
  }

   Container _continue(String text, VoidCallback voidCallback) {
    return Container(
      padding: EdgeInsets.all(3.h),
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

  Text _bankNames(String initText, RxString text) {
    return Text(
      "$initText: ${text.value}",
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    );
  }

  Container _bankdropdown() {
    List<String> _bankNames = [];
    for (BankTransferModel banks in _bankDropDownList) {
      _bankNames.add(banks.bankName);
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(1.h),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: DropdownButton<String>(
        hint: Text("Select Bank Account"),
        value: _bankDropDown.value,
        elevation: 16,
        isDense: false,
        isExpanded: true,
        underline: Container(
          color: Colors.transparent,
        ),
        style: TextStyle(color: Colors.black),
        onChanged: (String? newValue) {
          _bankDropDown.value = newValue!;
          for (BankTransferModel bank in _bankDropDownList) {
            if (bank.bankName == _bankDropDown.value) {
              _bankName.value = bank.bankName;
              _bankAddress.value = bank.bankAddress;
              _accountNo.value = bank.accountNo;
              _bankSwift.value = bank.bankSwift;
              _name.value = bank.name;
              _address.value = bank.address;
              _referenceNumber.value = bank.referenceNumber;
            }
          }
        },
        items: _bankNames.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
