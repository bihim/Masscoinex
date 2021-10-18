import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masscoinex/views/screens/nav_screens/verification_kyc/registration_details_screen/declaration_screen.dart';
import 'package:masscoinex/views/screens/nav_screens/verification_kyc/registration_details_screen/document_screen.dart';
import 'package:masscoinex/views/screens/nav_screens/verification_kyc/registration_details_screen/selfie_id_screen.dart';
import 'package:masscoinex/views/screens/nav_screens/verification_kyc/registration_details_screen/selfie_screen.dart';

class VerifyRegistrationDetailsController extends GetxController {
  var currentIndex = 0.obs;
  var previousIndex = 0.obs;

  List<StatelessWidget> screens(
      VerifyRegistrationDetailsController registrationDetailsController) {
    return [
      VerifyDocumentScreen(
        registrationDetailsController: registrationDetailsController,
      ),
      VerifySelfieIdScreen(
        registrationDetailsController: registrationDetailsController,
      ),
      VerifySelfieScreen(
        registrationDetailsController: registrationDetailsController,
      ),
      VerifyDeclarationScreen(
        registrationDetailsController: registrationDetailsController,
      ),
    ];
  }
}
