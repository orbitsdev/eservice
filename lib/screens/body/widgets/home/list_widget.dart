import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:eservice/theme/theme_constant.dart';

class ListTileWidget extends StatelessWidget {

  final String label;
  final IconData icon;
  const ListTileWidget({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ListTile(   
                 trailing: const FaIcon(FontAwesomeIcons.angleRight, color: purewhitebackground, size: 18,),
                title: Text(label, style: const TextStyle(color: purewhitebackground),),
                leading: ClipOval(
                  child: SizedBox(
                    height: 34,
                    width: 34,
                    child: Center(child: FaIcon(icon, color: purewhitebackground,)),
                    
                  ),
                ),
              );
              }
}
