import 'package:flutter/material.dart';

import 'package:eservice/theme/theme_constant.dart';

class CirclePadButton extends StatelessWidget {

  final Function addInput;
  final int input;
  const CirclePadButton({
    Key? key,
    required this.addInput,
    required this.input,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context){
    return  InkWell(
      onTap: (){
       addInput();
      },
        child: ClipOval(
          child: Container(
            height:74,
            width: 74,
            color: gcash_blue2,
            child: Center(child: Text(input.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 34),)),
          ),
        ),
    );
  }
}
