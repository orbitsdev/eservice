

import 'package:eservice/screens/body/widgets/home/section1/section1.dart';
import 'package:eservice/screens/body/widgets/home/section2/section_two.dart';
import 'package:eservice/screens/body/widgets/home/section3/lookforward.dart';
import 'package:eservice/screens/body/widgets/home/section3/promotion_card.dart';
import 'package:eservice/screens/body/widgets/line.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String screenName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
 

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
        const SectionOne(),
        const SectionTwo(),
          
        Lookforward(),
        const Line(thickness: 8),
        const PromotionCard(),
        ],
      ));
  }
}
