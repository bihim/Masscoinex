import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Security Center",
        ),
        backgroundColor: GlobalVals.appbarColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          _tiles(
            "Change Pin",
            "You can simply change pin from here",
            () {},
          ),
          _tiles(
            "Change Password",
            "You can simply change password from here",
            () {},
          ),
          _tiles(
            "App Lock",
            "Lock your Masscoinex App. Use your pin to unlock",
            () {},
          ),
          _tiles(
            "Activity Log",
            "You can view login here",
            () {},
          ),
          _tiles(
            "Deactivate Account",
            "You can deactivate your account from here",
            () {},
          ),
        ],
      ),
    );
  }

  ListTile _tiles(String title, String subTitle, VoidCallback voidCallback) {
    return ListTile(
      dense: true,
      title: Text(
        title,
      ),
      subtitle: Text(
        subTitle,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.grey,
        size: 5.h,
      ),
      onTap: () {},
    );
  }
}
