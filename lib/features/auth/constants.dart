import 'package:flutter/material.dart';

class Constants {
//create some controllers for textFields
  static TextEditingController signUpFullnameController =
      TextEditingController();
  static TextEditingController signUpEmailController = TextEditingController();
  static TextEditingController signUpPasswordController =
      TextEditingController();
  static TextEditingController signUpPhoneNumberController =
      TextEditingController();
  static TextEditingController loginEmailController = TextEditingController();
  static TextEditingController loginPasswordController =
      TextEditingController();
  static TextEditingController editingController = TextEditingController();
//create the keys that will be used in the forms
  static final signUpFormKey = GlobalKey<FormState>();
  static final loginFormKey = GlobalKey<FormState>();
  static final editFormKey = GlobalKey<FormState>();
//create these two variables to check if the password will be secured or not
  static bool signUpIsPassHidden = true;
  static bool loginIsPassHidden = true;
}
