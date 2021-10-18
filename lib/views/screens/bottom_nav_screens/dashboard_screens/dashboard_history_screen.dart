import 'package:flutter/material.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/models/fiat_history_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardHistoryScreen extends StatelessWidget {
  final fiatHistory = [
    FiatHistoryModel(
      id: 1,
      title: "Paid by Credit Card",
      transactionID: "#ASDKL23423lkj",
      date: "20-09-2021",
      money: "INR 10000",
      status: "Success",
      statusColor: Colors.green,
    ),
    FiatHistoryModel(
      id: 2,
      title: "Withdraw",
      transactionID: "#FKL23423l43",
      date: "02-09-2021",
      money: "INR 4000",
      status: "Pending",
      statusColor: Colors.yellow.shade800,
    ),
    FiatHistoryModel(
      id: 3,
      title: "Deposit by UPI",
      transactionID: "#9423422FAS",
      date: "20-09-2021",
      money: "INR 5000",
      status: "Failed",
      statusColor: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVals.appbarColor,
        title: Text(
          "History",
        ),
      ),
      body: Container(
        child: Column(
          children: [
            _sortFilter(),
            SizedBox(
              height: 1.h,
            ),
            _fiatHistory(),
          ],
        ),
      ),
    );
  }

  ListView _fiatHistory() {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${fiatHistory[index].title}\n",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Transaction ${fiatHistory[index].transactionID}\n",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                        ),
                      ),
                      TextSpan(
                        text: fiatHistory[index].date,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      fiatHistory[index].money,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.circle,
                          color: fiatHistory[index].statusColor,
                          size: 2.h,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          fiatHistory[index].status,
                          style: TextStyle(
                            color: fiatHistory[index].statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 0.3.h,
            color: Colors.grey.shade300,
          );
        },
        itemCount: fiatHistory.length);
  }

  Container _sortFilter() {
    return Container(
      color: GlobalVals.backgroundColor,
      width: double.infinity,
      height: 6.h,
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.sort_rounded,
                  color: Colors.white,
                ),
                Text(
                  "Sort",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.filter_alt,
                  color: Colors.white,
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
