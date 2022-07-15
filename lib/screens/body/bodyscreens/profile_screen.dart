import 'dart:io';

import 'package:eservice/dialogs/app.dart';
import 'package:eservice/screens/body/bodyscreens/edit_personal_information_screen.dart';
import 'package:eservice/screens/body/widgets/home/list_widget.dart';
import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/screens/widgets/white_line.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
const ProfileScreen({ Key? key }) : super(key: key);
static const String screenName = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  File? image;

  Future pickImage(ImageSource source) async{
      try{
          final image  =  await ImagePicker().pickImage(source: source);
          if(image ==  null) return; 
      }on PlatformException catch(e){
        print(e);
      }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: gcash_blue2,
    appBar: AppBar(
      
      elevation: 0,
      backgroundColor: gcash_blue2,
      leading: IconButton(onPressed: (){
        Get.back();
      }, icon: const FaIcon(FontAwesomeIcons.angleLeft)),
      title: const Text('Profile'),
    ),
    body: SingleChildScrollView(
      child: Container(
        color: gcash_blue2,
        child: Column(
    
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const VerticalSpace(height: 8),
            Container(
              
                    padding: const EdgeInsets.only(top: 0, left: screenPadding, right: screenPadding, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Container(
                          child: Image.asset('assets/images/profile.png', fit:  BoxFit.cover, width: 90, height: 90,),
                        ),
                      ),
                      const HorizontalSpace(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Brian Orbino', style: TextStyle(color: purewhitebackground),),
                          VerticalSpace(height: 8),
                          Text('093552732123', style: TextStyle(color: purewhitebackground),),
                        ],
                      )
                    ],
                  ),
                  const VerticalSpace(height: 16),
                  Row(
                    children: const [
                      FaIcon(FontAwesomeIcons.mapMarkerAlt, size: 13, color: purewhitebackground,), HorizontalSpace(width: 6),
                      Flexible(child: Text('278 Salem st kalawag 2 Isulan ', overflow: TextOverflow.ellipsis,  style: TextStyle(fontStyle: FontStyle.italic, color: purewhitebackground, fontSize: 13),)),
                    ],
                  ),
                  const VerticalSpace(height: 6),
                ],
              ),
            ),
            
            const WhiteLine(thickness: 1),
            
            Material(
              color: Colors.transparent,
              child: InkWell(
                 onTap: () async{
                    
                    App.showChangeProfileOption(context,pickImage);
                    },
                child: const ListTileWidget(label: 'Change Profile Picture', icon: FontAwesomeIcons.camera),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                 onTap: (){
                        Get.to(()=> const EditPersonalInformationScreen());
                    },
                child: const ListTileWidget(label: 'Change Personal Information', icon: FontAwesomeIcons.idCard),
              ),
            ),
            
            Material(
              color: Colors.transparent,
              child: InkWell(
                 onTap: (){
                        print('user account');
                    },
                child: const ListTileWidget(label: 'Change Account Information', icon: FontAwesomeIcons.shieldAlt),
              ),
            ),
            
    
    
    
          ],
        )
      ),
    ),
  );
}