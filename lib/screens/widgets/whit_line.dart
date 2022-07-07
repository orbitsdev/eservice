import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';

class WhitLine extends StatelessWidget {

  final double thickness;
  
  const WhitLine({
    Key? key,
    required this.thickness,
  }) : super(key: key);
    
  @override
  Widget build(BuildContext context){
    return Divider(
      thickness: thickness,
      color: input_background_ligt,
    );
  }
}
