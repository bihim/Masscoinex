import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masscoinex/controllers/currency_selected_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/models/transaction_history_model.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:masscoinex/views/components/arc_clip.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionHistory extends StatelessWidget {
  final currencyStats = Get.arguments;
  @override
  Widget build(BuildContext context) {
    /* String _smallName = currencyStats[0];
    String _assetName = currencyStats[1]; */
    String _smallName = "BTC";
    String _assetName = "assets/bitcoin.png";

    var _transactionHistoryList = [
      TransactionModelHistory(
        id: 1,
        currencyLogoPath: _assetName,
        currencyName: _smallName,
        transactionID: "FKR123FASERA",
        date: "09 March 2021, 08:30 PM",
        currencyStat: "BTC",
        transactionType: "Withdraw",
        status: "Pending",
      ),
      TransactionModelHistory(
        id: 2,
        currencyLogoPath: _assetName,
        currencyName: _smallName,
        transactionID: "FKR123FASERA",
        date: "09 March 2021, 08:30 PM",
        currencyStat: "BTC(1)-BCD(13,456)",
        transactionType: "Buy",
        status: "Success",
      ),
      TransactionModelHistory(
        id: 3,
        currencyLogoPath: _assetName,
        currencyName: _smallName,
        transactionID: "FKR123FASERA",
        date: "09 March 2021, 08:30 PM",
        currencyStat: "BTC(1)",
        transactionType: "Withdraw",
        status: "Pending",
      ),
      TransactionModelHistory(
        id: 4,
        currencyLogoPath: _assetName,
        currencyName: _smallName,
        transactionID: "FKR123FASERA",
        date: "09 March 2021, 08:30 PM",
        currencyStat: "BTC",
        transactionType: "Withdraw",
        status: "Pending",
      ),
      TransactionModelHistory(
        id: 5,
        currencyLogoPath: _assetName,
        currencyName: _smallName,
        transactionID: "FKR123FASERA",
        date: "09 March 2021, 08:30 PM",
        currencyStat: "BTC",
        transactionType: "Withdraw",
        status: "Pending",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction History"),
        backgroundColor: GlobalVals.appbarColor,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Flexible(
            child: _sortFilter(),
          ),
          Expanded(
            flex: 15,
            child: ListView.builder(
              /* shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), */
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.h),
                  padding: EdgeInsets.only(
                    top: 2.5.h,
                    bottom: 2.5.h,
                  ),
                  child: Card(
                    elevation: 0.5.h,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        1.5.h,
                      ),
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            _transactionHistoryList[index].currencyLogoPath,
                            height: 4.h,
                            width: 6.h,
                            color: Colors.blue.shade600,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _transactionHistoryList[index].currencyName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  _transactionHistoryList[index].transactionID,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  _transactionHistoryList[index].date,
                                  style: TextStyle(
                                    color: GlobalVals.appbarColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  _transactionHistoryList[index].currencyStat,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 10.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0.5.h,
                                    horizontal: 1.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _transactionHistoryList[index]
                                                .transactionType ==
                                            "Withdraw"
                                        ? Colors.blue
                                        : Colors.orange.shade700,
                                    borderRadius: BorderRadius.circular(
                                      1.h,
                                    ),
                                  ),
                                  child: Text(
                                    _transactionHistoryList[index]
                                        .transactionType,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 1.h,
                                      width: 1.h,
                                      decoration: BoxDecoration(
                                        color: _transactionHistoryList[index]
                                                    .status ==
                                                "Success"
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(2.h),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      _transactionHistoryList[index].status,
                                      style: TextStyle(
                                        color: _transactionHistoryList[index]
                                                    .status ==
                                                "Success"
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: _transactionHistoryList.length,
            ),
          ),
        ],
      ),
    );
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
