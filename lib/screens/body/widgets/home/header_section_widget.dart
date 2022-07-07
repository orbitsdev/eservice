import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';

class HeaderSectionWidget extends StatelessWidget {
  final String title;
  const HeaderSectionWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      color: purewhitebackground,
        child: Text(title.toUpperCase()),
      );
  }
}
