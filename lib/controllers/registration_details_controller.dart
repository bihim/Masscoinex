import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masscoinex/views/screens/auth/registration/registration_details_screen/declaration_screen.dart';
import 'package:masscoinex/views/screens/auth/registration/registration_details_screen/document_screen.dart';
import 'package:masscoinex/views/screens/auth/registration/registration_details_screen/selfie_id_screen.dart';
import 'package:masscoinex/views/screens/auth/registration/registration_details_screen/selfie_screen.dart';

class RegistrationDetailsController extends GetxController {
  var currentIndex = 0.obs;
  var previousIndex = 0.obs;

  List<StatelessWidget> screens(
      RegistrationDetailsController registrationDetailsController) {
    return [
      DocumentScreen(
        registrationDetailsController: registrationDetailsController,
      ),
      SelfieIdScreen(
        registrationDetailsController: registrationDetailsController,
      ),
      SelfieScreen(
        registrationDetailsController: registrationDetailsController,
      ),
      DeclarationScreen(
        registrationDetailsController: registrationDetailsController,
      ),
    ];
  }
}
