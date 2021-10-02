import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masscoinex/routes/route_list.dart';
import 'package:get/get.dart';
import 'package:masscoinex/views/screens/auth/add_account/add_account_screen.dart';
import 'package:masscoinex/views/screens/auth/add_account/add_account_complete_screen.dart';
import 'package:masscoinex/views/screens/auth/login/email_otp_screen.dart';
import 'package:masscoinex/views/screens/auth/login/login_screen.dart';
import 'package:masscoinex/views/screens/auth/login/login_screen_email.dart';
import 'package:masscoinex/views/screens/auth/login/mobile_verification_screen.dart';
import 'package:masscoinex/views/screens/auth/login/pin_screen.dart';
import 'package:masscoinex/views/screens/auth/registration/complete_screen.dart';
import 'package:masscoinex/views/screens/auth/registration/email_otp_screen.dart';
import 'package:masscoinex/views/screens/auth/registration/kyc_or_not_screen.dart';
import 'package:masscoinex/views/screens/auth/registration/kyc_uploaded_screen.dart';
import 'package:masscoinex/views/screens/auth/registration/mobile_verification_screen.dart';
import 'package:masscoinex/views/screens/auth/registration/registration_details_screen.dart';
import 'package:masscoinex/views/screens/auth/registration/registration_screen.dart';
import 'package:masscoinex/views/screens/main_screen.dart';
import 'package:masscoinex/views/screens/main_screen_copy.dart';
import 'package:masscoinex/views/screens/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'bindings/main_binding.dart';
import 'bindings/registration_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: 'Masscoinex',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Sans Fransisco Pro",
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false, // 1
            systemOverlayStyle: SystemUiOverlayStyle.light, // 2
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        initialBinding: MainBinding(),
        getPages: [
          GetPage(
            name: Routes.splashScreen,
            page: () => SplashScreen(),
          ),
          GetPage(
            name: Routes.mainScreen,
            page: () => MainScreen(),
            binding: MainBinding(),
          ),
          GetPage(
            name: Routes.mainScreenCopy,
            page: () => MainScreenCopy(),
            binding: MainBinding(),
          ),
          GetPage(
            name: Routes.loginScreen,
            page: () => LoginScreen(),
          ),
          GetPage(
            name: Routes.mobileVerification,
            page: () => MobileVerificationScreen(),
          ),
          GetPage(
            name: Routes.loginEmail,
            page: () => LoginEmailScreen(),
          ),
          GetPage(
            name: Routes.emailVerification,
            page: () => EmailOtpScreen(),
          ),
          GetPage(
            name: Routes.pinScreen,
            page: () => PinScreen(),
          ),
          GetPage(
            name: Routes.kycOrNot,
            page: () => KycOrNotScreen(),
          ),
          GetPage(
            name: Routes.registration,
            page: () => RegistrationScreen(),
            binding: RegistrationBinding(),
          ),
          GetPage(
            name: Routes.mobileVerificationRegistration,
            page: () => MobileVerificationRegistrationScreen(),
          ),
          GetPage(
            name: Routes.emailVerificationRegistration,
            page: () => EmailOtpRegistrationScreen(),
          ),
          GetPage(
            name: Routes.registrationDetails,
            page: () => RegistrationDetailsScreen(),
          ),
          GetPage(
            name: Routes.kycUploadedScreen,
            page: () => KycUploadedScreen(),
          ),
          GetPage(
            name: Routes.completeScreen,
            page: () => CompleteScreen(),
          ),
          GetPage(
            name: Routes.addAccount,
            page: () => AddAccountScreen(),
          ),
          GetPage(
            name: Routes.addAccountSuccessful,
            page: () => AddAccountCompleteScreen(),
          ),
        ],
      );
    });
  }
}
