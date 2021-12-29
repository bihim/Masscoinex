import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masscoinex/controllers/new_logics/currency_select_controller.dart';
import 'package:masscoinex/controllers/new_logics/currency_select_controller_force.dart';
import 'package:masscoinex/controllers/select_country_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CurrencySelectNewLogicForce extends StatelessWidget {
  final _selectCountryController = Get.put(CurrencySelectControllerNewLogicForce());

  CurrencySelectNewLogicForce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Select Currency"),
          backgroundColor: GlobalVals.appbarColor,
          bottom: PreferredSize(
            child: Container(
              color: Colors.white,
              height: 0.1.h,
            ),
            preferredSize: Size.fromHeight(
              0.1.h,
            ),
          ),
        ),
        backgroundColor: GlobalVals.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () {
                  return _selectCountryController.isCurrencyLoaded.value == true
                      ? _gridCurrency(context)
                      : SizedBox(
                          height: 100.h,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(() {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(2.h),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
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
                      _selectCountryController.setCurrency();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: _selectCountryController.isSaving.value == false
                          ? const Text(
                              "Continue",
                              style: TextStyle(color: GlobalVals.appbarColor),
                            )
                          : const CircularProgressIndicator(),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 3.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _gridCurrency(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 4),
      ),
      itemCount: _selectCountryController.currencySelectList.value.length,
      itemBuilder: (context, index) {
        return Obx(() {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(
                2.h,
              ),
              child: Container(
                margin: EdgeInsets.all(1.h),
                decoration: BoxDecoration(
                  color: _selectCountryController.selectedIndex.value == index
                      ? Colors.grey.shade200
                      : Colors.white,
                  border: Border.all(
                      width: 0.2.h,
                      color:
                          _selectCountryController.selectedIndex.value == index
                              ? Colors.red
                              : Colors.white),
                  borderRadius: BorderRadius.circular(
                    2.h,
                  ),
                ),
                child: ListTile(
                  leading: Image.network(
                    _selectCountryController
                        .currencySelectList.value[index].currencyImagePath,
                  ),
                  title: Text(
                    _selectCountryController
                        .currencySelectList.value[index].currencyName,
                  ),
                  subtitle: Text(
                    _selectCountryController
                        .currencySelectList.value[index].currencyCode,
                  ),
                  dense: true,
                  selected:
                      _selectCountryController.selectedIndex.value == index
                          ? true
                          : false,
                ),
              ),
              onTap: () {
                _selectCountryController.selectedIndex.value = index;
              },
            ),
          );
        });
      },
    );
  }
}

//Get.offAllNamed(Routes.loginEmail);
