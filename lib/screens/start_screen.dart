import 'package:eservice/screens/auth/signup_screen.dart';
import 'package:eservice/screens/auth/terms_and_condition.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
const StartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Scaffold(
          backgroundColor: gcash_blue1,
          body: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40,),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        // Text(
                        //   'Welcome to',
                        //   style: TextStyle(
                        //       fontSize: 24,
                        //       color: purewhitebackground,
                        //       fontWeight: FontWeight.w600),
                        // ),
                        const VerticalSpace(height: 24),
                        Container(
                          padding: const EdgeInsets.all(8),
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.asset(
                            'assets/images/layer.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text(
                          'E-Service',
                          style: TextStyle(
                              fontSize: 24,
                              color: purewhitebackground,
                              fontWeight: FontWeight.w600),
                        ),
                        const VerticalSpace(height: 3),
                        const Text(
                          'Easy, reliable way to take care of your home',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: purewhitebackground,
                          ),
                        ),
                        const VerticalSpace(height: 34),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(purewhitebackground),
                                shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side: const BorderSide(width: 0.1, color: purewhitebackground),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 20, color: gcash_blue1),
                              )),
                        ),
                        const VerticalSpace(height: 12),
                        SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width ,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(gcash_blue1),
                                shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side: const BorderSide(width: 0.5,  color: purewhitebackground),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.to(()=> const TermsAndCondition(), transition: Transition.downToUp);
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 20, color: purewhitebackground),
                              )),
                        ),
                        const VerticalSpace(height: 16),
                      
                      ],
                    ),
                  ),
                    Container(
                      child: Column(
                        children: const [

                          Text('Version 1.0.1', style: TextStyle(color: purewhitebackground),),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}