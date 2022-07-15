import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';

class WhiteLine extends StatelessWidget {

  final double thickness;
  
  const WhiteLine({
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
