import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/model/user_dm.dart';
import 'package:my_todo_app/ui/utilities/common/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

import '../../ui/screens/the_main_screen.dart';
import '../../ui/utilities/common/remote/firebase_services.dart';
import '../provider/auth_provider.dart';
import '../widgets/custom_auth_text_form_field.dart';

class TheSignUpScreen extends StatefulWidget {
  static String theRouteName = 'signup screen';

  const TheSignUpScreen({super.key});

  @override
  State<TheSignUpScreen> createState() => _TheSignUpScreenState();
}

class _TheSignUpScreenState extends State<TheSignUpScreen> {
  TextEditingController? theNameController = TextEditingController();
  TextEditingController theEmailController = TextEditingController();
  TextEditingController thePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
              theHintText: 'Enter your name',
              prefixIcon: const Icon(Icons.person),
              theController: theNameController,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'The name cannot be empty';
                } else if (p0.length < 3) {
                  return 'The name cannot be less than 3 characters';
                } else {
                  return null;
                }
              },
            ),
            CustomAuthTextFormField(
              theHintText: 'Enter the email',
              prefixIcon: const Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              theController: theEmailController,
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
              prefixIcon: const Icon(Icons.password),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child:Provider.of<TheAuthProvider>(context).loading? CircularProgressIndicator(): CustomElevatedButton(
                      data: 'Sign up',
                      onPress: () async {
                        // you have to specify the type in the GlobalKey like this ( ) to find the ".validate() "
                        if (formKey.currentState!.validate()) {
                          await Provider.of<TheAuthProvider>(context,
                                  listen: false)
                              .signUp(
                                  TheUserDM(
                                      theEmail: theEmailController.text.trim(),
                                      theName: theNameController!.text.trim()),
                                  thePasswordController.text.trim());
                          Navigator.of(context)
                              .popAndPushNamed(TheMainScreen.theRouteName);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
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
