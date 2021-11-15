import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:masscoinex/api/api_routes.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/models/checking_user/checking_user_model.dart';
import 'package:masscoinex/models/user_model.dart';
import 'package:masscoinex/routes/route_list.dart';

class PinController extends GetxController {
  var isLoggingLoading = false.obs;
  final _logger = Logger();

  loginUser() async {
    isLoggingLoading.value = true;
    final _box = await Hive.openBox(GlobalVals.hiveBox);
    final _success = CheckUserModel.fromJsonSuccess(
        json.decode(_box.get(GlobalVals.checkLogin)));
    final Map<String, dynamic> _body = {
      "email": _success.result!.email,
      "password": _success.result!.password,
      "verfiedOtp": "1",
      "verfiedPin": "1"
    };
    var _response = await http
        .post(Uri.parse(ApiRoutes.baseUrl + ApiRoutes.login), body: _body);

    if (_response.statusCode == 200) {
      isLoggingLoading.value = false;
      final _loginUser = UserModel.fromJson(json.decode(_response.body));
      _logger.d(_response.body);
      if (_loginUser.code == "1") {
        _box.put(GlobalVals.user, _response.body);
        _logger.d(_response.body);
        Get.offAllNamed(Routes.mainScreenCopy);
        GetStorage box = GetStorage();
        box.write("loggedIn", true);
        Fluttertoast.showToast(
          msg: "Successfully logged in",
          backgroundColor: Colors.green,
        );
      } else {
        GlobalVals.errorToast("Not logged in");
      }
    } else {
      isLoggingLoading.value = false;
      GlobalVals.errorToast(
        "Server Error",
      );
    }
  }
}
