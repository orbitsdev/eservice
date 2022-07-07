import 'package:eservice/dialogs/app.dart';
import 'package:eservice/screens/body/widgets/line.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpScreen extends StatelessWidget {
const HelpScreen({ Key? key }) : super(key: key);
static const String screenName = "/help";
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: screenPadding,),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Help', style: TextStyle(color: gcash_blue1, fontSize: 20, fontWeight: FontWeight.w600),),
                  GestureDetector(
                    onTap: (){
                      App.profileDialog(context);
                    },
                    child: Container(
                                
                      child: Image.asset(
                      'assets/images/profile.png',
                      width: 34,
                      height: 34,
                    ),),
                  ),
                  
                ],
              ),
            ),
    
            Container(
              padding: const EdgeInsets.all(8),
              child: Container(
              padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: gcash_blue1,
                
                ),
    
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
     
                  const Text('How can we help you?', style: TextStyle(color: purewhitebackground, fontSize: 20, fontWeight: FontWeight.w600),),
                    const VerticalSpace(height: 12),
                  const Text('Feel free to reach us. See our contact information below', textAlign: TextAlign.center, style: TextStyle(color: purewhitebackground),),
                            const VerticalSpace(height: 16),
            Container(
              decoration: BoxDecoration(
              color: gcash_blue6,
                borderRadius: BorderRadius.circular(100)
              ),
              width: 100,
              height: 30,
              child: Center(child: Text('Thank you'.toUpperCase(), style: const TextStyle(fontSize: 13, color: purewhitebackground),)),
              )
    
                ]),
              ),
            ),
           const Line(thickness: 2),
            ListTile(
              leading: ClipOval(child: Container(width: 44, height: 44, color:button_background ,child: const Center(child: FaIcon(FontAwesomeIcons.mobileAlt, color: purewhitebackground,size: 24,),),),),
              title: const Text('Mobile number', style: TextStyle(),),
              subtitle: const Text('09231276821', style: TextStyle(),),
            ),
                     const Line(thickness: 2),
            ListTile(
              leading: ClipOval(child: Container(width: 44, height: 44, color: gcash_blue4  , child: const Center(child: FaIcon(FontAwesomeIcons.envelope,color: purewhitebackground,size: 24,),),),),
              title: const Text('Email address', style: TextStyle(),),
              subtitle: const Text('e_service@gmail.com', style: TextStyle(),),
            ),
                     const Line(thickness: 2),
            ListTile(
              leading: ClipOval(child: Container(width: 44, height: 44, color: gcash_blue2,child: const Center(child: FaIcon(FontAwesomeIcons.facebook, color: purewhitebackground,size: 24,),),),),
              title: const Text('Facebook', style: TextStyle(),),
              subtitle: const Text('htttp://facebook.com', style: TextStyle(
                decoration: TextDecoration.underline,color: Colors.blueAccent
              ),),
            ),
                     const Line(thickness: 2),
        ],
      ),
    );
  }
}