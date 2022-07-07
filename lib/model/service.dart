import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Service {

final String title;
final IconData icon;
  Service({
    required this.title,
    required this.icon,
  });

}

final listofservices = [

  Service(title: 'Laundry', icon: FontAwesomeIcons.fan),
  Service(title: 'Computer ', icon: FontAwesomeIcons.laptop),
  Service(title: 'Aircon', icon: FontAwesomeIcons.airFreshener),
  Service(title: 'Repair', icon: FontAwesomeIcons.toolbox,),
  Service(title: 'Pay', icon: FontAwesomeIcons.creditCard),
  Service(title: 'Occasion', icon: FontAwesomeIcons.birthdayCake),
];
