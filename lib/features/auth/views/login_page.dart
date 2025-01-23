import 'package:flutter/material.dart';
import 'package:go_egypt_with_state_management/features/auth/constants.dart';
import 'package:go_egypt_with_state_management/features/layout/layout_view.dart';
import 'package:go_egypt_with_state_management/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/title_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //get email and password data from shared preferences
  String email = '';
  String password = '';
  getCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email") ?? "";
    password = prefs.getString("pass") ?? "";
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: Constants.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //call "TitleText" to add title "Login"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TitleText(S.of(context).Login, 40),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //call "CustomTextField" to ask the user to enter his email address and validate his input
                CustomTextField(
                  controller: Constants.loginEmailController,
                  label: S.of(context).email_address,
                  prefix: Icons.email,
                  //use "validator" to check if the user input meets requirements
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return S.of(context).please_enter_a_valid_email;
                    } else {
                      return null;
                    }
                  },
                ),
                //call "CustomTextField" to ask the user to enter his password
                CustomTextField(
                  controller: Constants.loginPasswordController,
                  label: S.of(context).password,
                  prefix: Icons.lock,
                  validator: (value) {
                    if (value!.length < 6) {
                      return S
                          .of(context)
                          .password_should_contain_at_least_6_characters;
                    } else {
                      return null;
                    }
                  },
                  isPassword: true,
                  obscureText: Constants.loginIsPassHidden,
                  //convert the value of "loginIsPassHidden" variable when pressing the suffix icon to show and hide password
                  onSuffixPressed: () {
                    setState(() {
                      Constants.loginIsPassHidden =
                          !Constants.loginIsPassHidden;
                    });
                  },
                ),
                //call "CustomButton" to add a "login" button
                CustomButton(
                  onPressed: () {
                    //if the user inputs meet all requirements, navigate to another page
                    if (Constants.loginFormKey.currentState!.validate()) {
                      if (Constants.loginEmailController.text == email &&
                          Constants.loginPasswordController.text == password) {
                        Constants.loginEmailController.clear();
                        Constants.loginPasswordController.clear();
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const LayoutView();
                          },
                        ));
                      } else {
                        //if a problem is found, a snackBar will show up
                        SnackBar snackBar = const SnackBar(
                          content: Text("Incorrect email or password"),
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                  text: S.of(context).Login,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
