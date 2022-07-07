import 'package:eservice/screens/body/bodyscreens/help_screen.dart';
import 'package:eservice/screens/body/bodyscreens/home_screen.dart';
import 'package:eservice/screens/body/bodyscreens/points_screen.dart';
import 'package:eservice/screens/body/bodyscreens/services._screen.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({ Key? key }) : super(key: key);

  @override
  _AppMainScreenState createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {

   int currentIndex =0;
   final screens = [
    const HomeScreen(),
    const PointsScreen(),
    const ServicesScreen(),
    const HelpScreen(),

   ];
   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: purewhitebackground,
        body: screens[currentIndex], 
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: purewhitebackground,
          selectedItemColor: gcash_blue1,
          unselectedItemColor: Colors.grey[500],
          currentIndex: currentIndex,
          onTap: (index)=> setState(()=> currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home' ,backgroundColor: Colors.red),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.gift), label: 'Points',backgroundColor: Colors.blue),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.handHolding), label: 'Services',backgroundColor: Colors.blue),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.questionCircle), label: 'Help',backgroundColor: Colors.yellow),
          ],
        ),
      ),
    );
  }
}