import 'package:eservice/screens/auth/signup_screen.dart';
import 'package:eservice/screens/body/app_main_screen.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(screenPadding),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/layer.png'),
                ),
                TextFormField(
                  controller: email,
                  cursorColor: input__icon_background,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    suffixIcon: email.text.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              email.clear();
                            },
                            icon: const FaIcon(
                              Icons.close,
                              color: input__icon_background,
                            )),
                    prefixIcon: Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 40,
                        width: 40,
                        child: const Center(
                            child: Icon(Icons.email,
                                color: input__icon_background))),
                    filled: true,
                    fillColor: input_background,
                    border: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(inputradius)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    label: Text('Email', style: lightbody1),
                    labelStyle: lightbody2,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(inputradius)),
                      borderSide: BorderSide(
                        color: input__icon_background,
                      ),
                    ),
                  ),
                  style: lightbody1,
                ),
                const VerticalSpace(height: 8),
                TextFormField(
                  controller: password,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: _showPassword,
                  cursorColor: input__icon_background,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (password.text.isNotEmpty)
                          IconButton(
                              onPressed: () {
                                password.clear();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: input__icon_background,
                              )),
                        IconButton(
                            onPressed: () {
                              setState(() => _showPassword = !_showPassword);
                            },
                            icon: FaIcon(
                              _showPassword
                                  ? FontAwesomeIcons.eyeSlash
                                  : FontAwesomeIcons.eye,
                              color: input__icon_background,
                            )),
                      ],
                    ),
                    prefixIcon: Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 40,
                        width: 40,
                        child: const Center(
                            child: Icon(Icons.lock,
                                color: input__icon_background))),
                    filled: true,
                    fillColor: input_background,
                    border: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(inputradius)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    label: Text('Password', style: lightbody1),
                    labelStyle: lightbody2,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(inputradius)),
                      borderSide: BorderSide(
                        color: input__icon_background,
                      ),
                    ),
                  ),
                  style: lightbody1,
                ),
                const VerticalSpace(height: 24),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const AppMainScreen());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              'Sign in',
                              style: lightheadline6.copyWith(fontSize: 18),
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(button_background),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ))),
                        ),
                      ),
                      const VerticalSpace(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 1,
                              width: 40,
                              color: Colors.grey[600],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: Text(
                                'or',
                                style: lightbody1.copyWith(fontSize: 14),
                              ),
                            ),
                            Container(
                              height: 1,
                              width: 40,
                              color: Colors.grey[600],
                            ),
                          ]),
                      const VerticalSpace(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Google,
                          padding: const EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t Have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const SignupScreen(),
                            transition: Transition.rightToLeft);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: input__icon_background,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
