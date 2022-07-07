import 'package:flutter/material.dart';

class PointsScreen extends StatelessWidget {
const PointsScreen({ Key? key }) : super(key: key);
static const String screenName = '/points';
  @override
  Widget build(BuildContext context){
    return Container(
      child: const Center(child: Text('Points')),
    );
  }
}