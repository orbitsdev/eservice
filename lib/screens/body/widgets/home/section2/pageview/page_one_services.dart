import 'package:eservice/screens/body/widgets/home/section2/service_icon_title.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageOneServices extends StatelessWidget {
const PageOneServices({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) =>Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [

                                ServiceIconTitle(title: 'Laundry', icon: FontAwesomeIcons.fan),
                                ServiceIconTitle(title: 'Formating ', icon: FontAwesomeIcons.laptop),
                                ServiceIconTitle(title: 'Aircon Installation', icon: FontAwesomeIcons.drawPolygon),
                                ServiceIconTitle(title: 'Software', icon: FontAwesomeIcons.code),
                        ],
                      ),
                      const VerticalSpace(height:12),
                      Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [

                                ServiceIconTitle(title: 'Laundry', icon: FontAwesomeIcons.fan),
                                ServiceIconTitle(title: 'Formating Repair ', icon: FontAwesomeIcons.laptop),
                                ServiceIconTitle(title: 'Aircon Installation', icon: FontAwesomeIcons.drawPolygon),
                                ServiceIconTitle(title: 'Aircon Installation', icon: FontAwesomeIcons.drawPolygon),
                               
                        ],
                      ),
                    ],
                  ),
                );
}