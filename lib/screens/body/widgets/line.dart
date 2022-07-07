import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double thickness;
  const Line({
    Key? key,
    required this.thickness,
  }) : super(key: key);
  @override
  Widget build(BuildContext context)=>
    Divider(
            thickness: thickness,
            color: bodywhitebackground3,
          );
  
}
