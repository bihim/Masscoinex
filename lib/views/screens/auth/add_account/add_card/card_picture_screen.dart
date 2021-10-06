import 'package:flutter/material.dart';
import 'package:masscoinex/controllers/add_account_controller.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardPictureScreen extends StatelessWidget {
  final AddAccountController addAccountController;
  const CardPictureScreen({Key? key, required this.addAccountController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _cardUpload(
              "Upload (Front Side Card)\n\n",
              "  Write the following note on a piece of paper and take a selfie holding the note\n\n\n",
              '"I Swadesh Singh, Registering on Masscoinex to Buy/Sell Cryptocurrencies 06-06-2020 & (Signature)"\n\n\n'),
          SizedBox(
            height: 2.h,
          ),
          _cardUpload(
              "Upload (Selfie with your card)\n\n",
              "  Upload a selfie of yourself make sure your face is clearly visible. No cap, sunglasses or any distraction on your face.\n\n\n",
              null),
          SizedBox(
            height: 2.h,
          ),
          _continue(),
        ],
      ),
    );
  }

  Container _cardUpload(
      String firstText, String secondText, String? thirdText) {
    return Container(
      width: double.infinity,
      height: 30.h,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Card(
              elevation: 1.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.h),
              ),
              child: Container(
                height: 28.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.h),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.h, right: 4.h),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: firstText,
                            style: TextStyle(
                              color: GlobalVals.backgroundColor,
                              fontSize: 18.sp,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.info,
                              color: Colors.red,
                              size: 2.h,
                            ),
                          ),
                          TextSpan(
                            text:
                                secondText,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15.sp,
                            ),
                          ),
                          thirdText == null
                              ? WidgetSpan(child: SizedBox())
                              : TextSpan(
                                  text:
                                      thirdText,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14.sp,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Center(
                child: Stack(
                  children: [
                    Card(
                      elevation: 1.h,
                      shape: CircleBorder(
                        side: BorderSide(
                          width: 0.5.h,
                          color: Colors.white,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            5.h,
                          ),
                          child: Image.asset(
                            "assets/avatar.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        radius: 5.h,
                      ),
                    ),
                    Positioned(
                      bottom: 1.h,
                      right: 1.h,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(0.4.h),
                        child: Icon(
                          Icons.add_a_photo,
                          size: 2.h,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
          addAccountController.cardScreenIndex.value = 2;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: const Text("Continue"),
        ),
      ),
    );
  }
}
