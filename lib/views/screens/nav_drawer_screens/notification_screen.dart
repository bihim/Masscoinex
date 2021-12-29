import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/models/dashboard_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getAllNotification();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification Screen",
        ),
        backgroundColor: GlobalVals.appbarColor,
      ),
    );
  }

  _getAllNotification() {
    final _box = Hive.box(GlobalVals.hiveBox);
    final dashboardValue =
        DashboardModel.fromJson(json.decode(_box.get(GlobalVals.dashBoard)));
  }
}
