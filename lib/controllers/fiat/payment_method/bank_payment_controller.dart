import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:masscoinex/api/api_routes.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:http/http.dart' as http;
import 'package:masscoinex/models/dashboard_model.dart';
import 'package:masscoinex/models/fiat/deposit/deposit_model.dart';
import 'package:masscoinex/models/fiat/payments/bank/bank_deposit_confirmation_model.dart';
import 'package:masscoinex/models/user_model.dart';
import 'package:masscoinex/models/fiat/payments/save_deposit_model.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:masscoinex/views/screens/bottom_nav_screens/fiat_screens/payment_screens/webview.dart';

class BankPaymentController extends GetxController {
  var isListLoaded = true.obs;
  final box = Hive.box(GlobalVals.hiveBox);
  var _logger = Logger();
  var amount = "".obs;
  var paymentMethodId = "".obs;
  var paymentMethodName = "".obs;
  var transactionNo = "".obs;
  var referenceNo = "".obs;
  var selectedIndex = 0.obs;
  var isButtonActive = false.obs;
  var isDepositSaved = true.obs;
  var id = "".obs;
  var userDataList = <UserBank>[].obs;

  /**/
  final bankName = "".obs;
  final bankAddress = "".obs;
  final accountNo = "".obs;
  final name = "".obs;

  /**/
  final _box = Hive.box(GlobalVals.hiveBox);
  var depositFeeController = TextEditingController();
  var depositAmountController = TextEditingController();
  var amountController = TextEditingController();
  var currencyController = TextEditingController();

  getDepositInfoForUpi() async {
    isListLoaded.value = false;
    final userInfo = UserModel.fromJson(json.decode(box.get(GlobalVals.user)));
    final _dashboard =
        DashboardModel.fromJson(json.decode(_box.get(GlobalVals.dashBoard)));
    final depositInfo = depositModelFromJson(box.get(GlobalVals.deposit));
    paymentMethodId.value = box.get(GlobalVals.paymentMethodId);
    paymentMethodName.value = box.get(GlobalVals.paymentMethodName);
    referenceNo.value = box.get(GlobalVals.referenceNo) ?? "";
    amount.value = depositInfo.amount;
    final token = userInfo.result.token;
    //final token = GlobalVals.defaultToken;
    Map<String, String> header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    _logger.d("Values: paymentmethodid: ${paymentMethodId.value}");
    final Map<String, dynamic> body = {
      "payment_mode": "bank_transfer",
      "amount": depositInfo.amount,
      "payment_method_id": paymentMethodId.value,
      "payment_method_name": paymentMethodName.value,
    };

    var response = await http.post(
        Uri.parse(ApiRoutes.baseUrl + ApiRoutes.depositConfirmation),
        body: body,
        headers: header);

    _logger.d(response.body);

    if (response.statusCode == 200) {
      isListLoaded.value = true;
      var result = bankDepositConfirmationModelFromJson(response.body);
      if (result.code == "1") {
        isButtonActive.value = true;
        userDataList.value = result.userBanks;
        transactionNo.value = result.transactionNo;

        bankName.value = result.userBanks.first.bankName;
        bankAddress.value = result.userBanks.first.bankAddress;
        accountNo.value = result.userBanks.first.accountNo;
        name.value = result.userBanks.first.fullName;

        depositFeeController.text = result.depositFee.toString();
        depositAmountController.text = result.depositAmount.toString();
        amountController.text = depositInfo.amount;
        currencyController.text = _dashboard.wallet.currency ?? "";
      } else {
        GlobalVals.errorToast("Fetch Error");
      }
    } else {
      isListLoaded.value = true;
      GlobalVals.errorToast("Server Error: ${response.statusCode}");
    }
  }

  saveDeposit() async {
    isDepositSaved.value = false;
    final _userInfo =
        UserModel.fromJson(json.decode(_box.get(GlobalVals.user)));
    final _token = _userInfo.result.token;
    Map<String, String> _header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    final Map<String, dynamic> _body = {
      "amount": amount.value,
      "payment_mode": "bank_transfer",
      "payment_method_id": paymentMethodId.value,
      "payment_method_name": paymentMethodName.value,
      "transaction_no": transactionNo.value,
      "reference_no": referenceNo.value,
      "id": id.value,
    };

    var _response = await http.post(
        Uri.parse(ApiRoutes.baseUrl + ApiRoutes.saveDeposit),
        body: _body,
        headers: _header);
    _logger.d("Deposit Info: ${_response.body}");

    if (_response.statusCode == 200) {
      isDepositSaved.value = true;
      var _result = saveDepositModelFromJson(_response.body);
      if (_result.code == "1") {
        GlobalVals.successToast("Successfully Deposited");
        if (_result.loginUrl != null) {
          Get.to(WebViewExample(url: _result.loginUrl));
        } else {
          Get.offAllNamed(Routes.mainScreenCopy);
        }
      } else {
        GlobalVals.errorToast("Error Occurred");
      }
    } else {
      isDepositSaved.value = true;
      GlobalVals.errorToast("Server Error: ${_response.statusCode}");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDepositInfoForUpi();
  }
}
