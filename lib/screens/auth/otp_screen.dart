import 'package:eservice/screens/auth/animation/mpin_animation_controller.dart';
import 'package:eservice/screens/auth/animation/mpin_widget.dart';
import 'package:eservice/screens/auth/animation/pin_animation.dart';
import 'package:eservice/screens/body/app_main_screen.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}



class _OtpScreenState extends State<OtpScreen> {
  MpinController animationController =  MpinController();
  @override
  void setState(VoidCallback fn) {
    if(mounted){

    super.setState(fn);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            }, icon: FaIcon(FontAwesomeIcons.angleLeft)),
        backgroundColor: gcash_blue1,
        title: const Text('Enter Otp Code'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalSpace(height: 24),
            MpinWidget(pinLength: 4, controller: animationController),
            VerticalSpace(height: 24),
            GridView.count(
                            physics: NeverScrollableScrollPhysics(),
              reverse: true,
              shrinkWrap: true,
              mainAxisSpacing: 10,
              childAspectRatio: 1.3,
              crossAxisCount: 3 , children: List.generate(9, (index) =>Container(child: Center(child: materialButton(index + 1))) ),),
            VerticalSpace(height: 12),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              reverse: true,
              shrinkWrap: true, 
              mainAxisSpacing: 10,
              childAspectRatio: 1.6,
              crossAxisCount: 3 , children: [
                Container(child: Center(child: materialButton(0))),
                IconButton(onPressed: (){
            
                  animationController.delete!();
                }, icon: FaIcon(FontAwesomeIcons.backspace, size: 34, color: gcash_blue1))
              ],),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalSpace(height: 34),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t you recieve any code? ', style: TextStyle(color: gcash_blue4, )),
                    GestureDetector(
                      onTap: (){
                        
                      },
                      child: Text('Resend', style: TextStyle(color: gcash_blue1, fontWeight: FontWeight.bold ))),
                    
                  ],
                ),
                VerticalSpace(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(()=> AppMainScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'Verify',
                          style: lightheadline6.copyWith(fontSize: 18),
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(gcash_blue1),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ))),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget materialButton(int input) {
    return InkWell(
      onTap: (){
        animationController.addInput!(input.toString());
      },
        child: ClipOval(
          child: Container(
            height:66,
            width: 66,
            color: gcash_blue1,
            child: Center(child: Text(input.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 34),)),
          ),
        ),
    );
  }
}
