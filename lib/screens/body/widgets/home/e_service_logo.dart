import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EServiceLogo extends StatelessWidget {
const EServiceLogo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  Container(
      
            constraints: const BoxConstraints(
              minHeight: 80,
            ),
            color: background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 34,
                      width: 34,
                      child: Image.asset('assets/images/playstore.png'),
                    ),
                    const HorizontalSpace(width: 4),
                    Text(
                      'E-service',
                      style: Get.textTheme.headline5!.copyWith(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}