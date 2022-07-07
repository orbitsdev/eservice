import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Datefieldcontent extends StatelessWidget {

  final String text;

  const Datefieldcontent({super.key, required this.text});
  @override
  Widget build(BuildContext context){
    return Row(
                children: [
                  FaIcon(FontAwesomeIcons.calendar, size: 13,), HorizontalSpace(width: 4),
                  Text(text, style: TextStyle( fontWeight: FontWeight.w300,),),
                ],
              );
  }
}