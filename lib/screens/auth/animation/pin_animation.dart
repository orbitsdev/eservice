import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';

import 'package:eservice/screens/auth/animation/mpin_animation_controller.dart';



class PinAnimation extends StatefulWidget {
   final MpinAnimationController? controller; 
  const PinAnimation({
    Key? key,
    this.controller,
  }) : super(key: key);
  
  @override
  _PinAnimationState createState() => _PinAnimationState(controller);
}

class _PinAnimationState extends State<PinAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation;
  late Animation _colorAnimation;
  String pin="";
  void animate(String input){
    _controller.forward();
    setState(() {
      pin = input;    
      });
  }

  
  _PinAnimationState(controller){
    controller?.animate = animate;
  }
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _sizeAnimation = Tween<double>(begin: 40, end: 50).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _colorAnimation = ColorTween(begin: bodywhitebackground, end: gcash_blue6).animate(_controller);
    _controller.addListener(() => setState(() {
      if(_controller.status ==  AnimationStatus.completed){
        _controller.reverse();
      }
    }));
    super.initState();
  }
@override
  void setState(VoidCallback fn) {
    if(mounted){
    super.setState(fn);

    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      height:64,
      width:64,
      alignment: Alignment.center,
      child: Container(
        height: _sizeAnimation.value,
        width: _sizeAnimation.value,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:  _colorAnimation.value ,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Opacity(
          opacity: 1,
          child: Transform.scale(
            scale: _sizeAnimation.value / 48,
            child: Text(pin, style: TextStyle(color:gcash_blue1, fontSize: 25, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
