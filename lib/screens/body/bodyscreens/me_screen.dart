import 'package:flutter/material.dart';

class MeScreen extends StatelessWidget {
const MeScreen({ Key? key }) : super(key: key);
static const String screenName = '/me';
  @override
  Widget build(BuildContext context){
   return Container(
      child: const Center(child: Text('Me')),
    );
  }
}