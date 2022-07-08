import 'package:eservice/routes/app_name.dart';
import 'package:eservice/screens/auth/controller/authcontroller.dart';
import 'package:eservice/screens/auth/otp_screen.dart';
import 'package:eservice/screens/auth/signin_screen.dart';
import 'package:eservice/screens/auth/signup_screen.dart';
import 'package:eservice/screens/body/app_main_screen.dart';
import 'package:eservice/screens/body/bodyscreens/edit_personal_information_screen.dart';
import 'package:eservice/screens/body/bodyscreens/help_screen.dart';
import 'package:eservice/screens/body/bodyscreens/home_screen.dart';
import 'package:eservice/screens/body/bodyscreens/points_screen.dart';
import 'package:eservice/screens/body/bodyscreens/profile_screen.dart';
import 'package:eservice/screens/body/bodyscreens/search_services_screen.dart';
import 'package:eservice/screens/body/bodyscreens/services._screen.dart';
import 'package:eservice/screens/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(Authcontroller(), permanent: true);
  });
  
  runApp(const EserviceApp());
}

class EserviceApp extends StatelessWidget {
const EserviceApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      home: SignupScreen(),
      getPages: [
        GetPage(name: AppName.start, page: ()=> StartScreen()),
        GetPage(name: AppName.sigin, page: ()=> SigninScreen()),
        GetPage(name: AppName.signup, page: ()=> SignupScreen()),
        GetPage(name: AppName.otp, page: ()=> OtpScreen()),
        GetPage(name: AppName.main, page: ()=> AppMainScreen()),
        GetPage(name: AppName.home, page: ()=> HomeScreen()),
        GetPage(name: AppName.points, page: ()=> PointsScreen()),
        GetPage(name: AppName.help, page: ()=> HelpScreen()),
        GetPage(name: AppName.service, page: ()=> ServicesScreen()),
        GetPage(name: AppName.searchservice, page: ()=> SearchServicesScreen()),
        GetPage(name: AppName.profile, page: ()=> ProfileScreen()),
        GetPage(name: AppName.editpersonalprofile, page: ()=> EditPersonalInformationScreen()),
        

      ],
      debugShowCheckedModeBanner: false,
    );
  }
}