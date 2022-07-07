import 'package:flutter/material.dart';

import 'package:eservice/screens/auth/animation/mpin_animation_controller.dart';
import 'package:eservice/screens/auth/animation/pin_animation.dart';

class MpinController{
  void Function(String)? addInput;
  void Function()? delete; 
}
class MpinWidget extends StatefulWidget {

  final int pinLength;
  final MpinController controller;
  
  const MpinWidget({
  
    Key? key,
    required this.pinLength,
    required this.controller,
  }) : assert(pinLength <= 6 && pinLength > 0 ) , super(key: key);
  
  
 


  
  @override
  _MpinWidgetState createState() => _MpinWidgetState(controller);
}

class _MpinWidgetState extends State<MpinWidget> {

  late List<MpinAnimationController> _animationController;
  String mpin = "";
  _MpinWidgetState(MpinController controller){
    controller.addInput = addInput;
    controller.delete = delete;
  }

 @override
  void setState(VoidCallback fn) {

    if(mounted){
    super.setState(fn);

    }
  }
  @override
  void initState() {
    super.initState();

    _animationController =  List.generate(widget.pinLength, (index) => MpinAnimationController());

  }
  
  void delete() {
       print(mpin);
    if(mpin.isNotEmpty){
       mpin = mpin.substring(0,mpin.length -1);
      _animationController[mpin.length].animate!('');

    }
     
   
  }
    void addInput(String input){
      
        if(mpin.length < widget.pinLength){
          mpin+= input;
          _animationController[mpin.length -1].animate!(input);  
          print(mpin);
        }
        

        if(mpin.length ==  widget.pinLength){
          print('completed');
        }

     
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.pinLength, (index) => PinAnimation(controller:  _animationController[index],) ),); 
  }
}