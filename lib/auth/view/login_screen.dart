import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_todo_app/auth/provider/auth_provider.dart';
import 'package:my_todo_app/auth/view/signup_screen.dart';
import 'package:my_todo_app/auth/widgets/custom_auth_text_form_field.dart';
import 'package:my_todo_app/ui/screens/the_main_screen.dart';
import 'package:my_todo_app/ui/utilities/common/app_colors.dart';
import 'package:my_todo_app/ui/utilities/common/remote/firebase_services.dart';
import 'package:provider/provider.dart';

import '../../ui/utilities/common/widgets/custom_elevated_button.dart';

class TheLoginScreen extends StatefulWidget {
  static String theRouteName = 'login screen';

  const TheLoginScreen({super.key});

  @override
  State<TheLoginScreen> createState() => _TheLoginScreenState();
}

class _TheLoginScreenState extends State<TheLoginScreen> {
  TextEditingController theEmailController = TextEditingController();
  TextEditingController thePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // we make this to make a validator
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
              child: Image.asset(
                'assets/images/my logo.jpg',
                height: 100,
              ),
            ),
            const Text(
              'please enter your email \n and password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            CustomAuthTextFormField(
              theHintText: 'Enter the email',
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: AppColors.thePrimary,
              ),
              theController: theEmailController,
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                if (isValidEmail(p0 ?? '')) {
                  return null;
                } else {
                  return 'Invalid email';
                }
              },
            ),
            CustomAuthTextFormField(
              theHintText: 'Enter the password',
              prefixIcon: const Icon(
                Icons.password,
                color: AppColors.thePrimary,
              ),
              theController: thePasswordController,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'password cannot be empty';
                } else if (p0.length < 7) {
                  return 'password cannot be less than 7 characters';
                } else {
                  return null;
                }
              },
            ),
            TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                  textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 18))),
              child: const Text('Forget the password'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child:Provider.of<TheAuthProvider>(context).loading? CircularProgressIndicator():
              CustomElevatedButton(
                      data: 'Login',
                      onPress: () async {
                        // you have to specify the type in the GlobalKey like this ( ) to find the ".validate() "
                        if (formKey.currentState!.validate()) {
                          Provider.of<TheAuthProvider>(context, listen: false)
                              .login(
                            theEmailController.text.trim(),
                            thePasswordController.text.trim(),
                          );
                          Navigator.of(context)
                              .pushReplacementNamed(TheMainScreen.theRouteName);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account sign in : ) ",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(TheSignUpScreen.theRouteName);
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool isValidEmail(String inputEmail) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(inputEmail);
  }
}
