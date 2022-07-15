import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoIcon extends StatelessWidget {
 
  final IconData icon;
  final Color? color;
  final String message;

  const InfoIcon({super.key, required this.icon, required this.color, required this.message}); 

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          color: color,
          size: 20,
        ),
        HorizontalSpace(width: 4),
        Flexible(
            child: Text(
          message,
          style: TextStyle(fontSize: 13, color: color),
        )),
      ],
    );
  }
}
