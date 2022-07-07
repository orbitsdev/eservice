import 'package:flutter/material.dart';

class TitleBuilder extends StatelessWidget {
  const TitleBuilder({
    Key? key,
    required this.name,
  }) : super(key: key);
final String name;
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18,),
      child: Text(name, style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500)),
    );
  }
}
