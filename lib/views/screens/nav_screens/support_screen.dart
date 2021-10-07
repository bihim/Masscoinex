import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SupportScreen extends StatelessWidget {
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
            Icons.headset_mic_outlined,
            "Telephone Center",
            () {},
          ),
          _tiles(
            Icons.email_outlined,
            "Email Support",
            () {},
          ),
          _tiles(
            Icons.chat,
            "Live Chat",
            () {},
          ),
        ],
      ),
    );
  }

  ListTile _tiles(IconData iconData, String title, VoidCallback voidCallback) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.grey,
        size: 3.h,
      ),
      title: Text(
        title,
      ),
      onTap: voidCallback,
    );
  }
}
