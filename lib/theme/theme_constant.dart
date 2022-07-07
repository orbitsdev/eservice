
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



///font size
double subtitle = 14;
double subtitle2 = 13;
double bodytext = 15;
double headertext  = 35;


const double horizontalpadding = 12;
///gcash color 
const gcash_blue1 = Color(0xff0062C8);
const gcash_blue2 = Color(0xff0054CB);
const gcash_blue3 = Color(0xffEFF4F8);
const gcash_blue4 = Color(0xff297BFA);
const gcash_blue5 = Color(0xff004A99);
const gcash_blue6 = Color.fromARGB(255, 98, 152, 233);
const gcash_blue7 = Color.fromARGB(255, 177, 216, 248);
const gcash_blue8 = Color.fromARGB(255, 190, 223, 250);
const gcash_blue9 = Color.fromARGB(255, 7, 9, 156);

///text
///grey
const gray_n1 = Color(0xffE0E0E0);
///
const unselected_gray = Color(0xff737373);
//gradient

const green1 = Color(0xff0ccda3);
const green2 = Color(0xffc1fcd3);

const gcolor1 = Color(0xffeebd89);
const gcolor2= Color(0xffd13abd);

const background = Color(0xff10362F);
const purewhitebackground = Color(0xffFFFFFF);
const bodywhitebackground = Color(0xffEDEEF0);
const bodywhitebackground2= Color(0xffDEDEDE);
const bodywhitebackground3= Color(0xffF7F6FC);

const pricetagbgcolor= Color(0xff15B482);
const grey2= Color(0xffF0F2F3);
const grey3= Color(0xffD8D8D8);

const double inputradius = 16;
const double buttonreadius = 16;
const double buttoncircular = 100;
const double screenPadding = 20;

//input field
const input_background = Color(0xff001D1D);
const input__icon_background = Color(0xff7AC1BA);
const String fontfamily = "Aeonik";
const navigatorbackgorund = Color(0xff216C5E);
//light
const input_background_ligt = Color(0xffF9F9FA);
TextStyle lightbody1 = const TextStyle(fontSize: 18, color: Colors.white);
TextStyle lightbody2 = const TextStyle(fontSize: 16, color: Colors.white);
TextStyle lightsubtittle1 = const TextStyle(fontSize: 14, color: Colors.white);
TextStyle greytext = TextStyle(fontSize: 18, color: Colors.grey[400]);


TextStyle lightheadline6 = Get.textTheme.headline6!.copyWith(color: Colors.white);

TextTheme textheme = const TextTheme(
  
  
  bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,),
  bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  
);



//button
const button_background = Color(0xff2C9465);

ThemeData apptheme = ThemeData(
  
  textSelectionTheme: const TextSelectionThemeData(
    selectionHandleColor: gcash_blue1,
  
    
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
    // Status bar color
    statusBarColor: gcash_blue2,
    statusBarIconBrightness: Brightness.light,

  
  )),
  fontFamily: fontfamily,
  primaryColor: gcash_blue2,
  
  textTheme:  textheme  
);