
import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

import 'package:eservice/theme/theme_constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  final String image;
  const ServiceCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 13),
      height: 200,
      decoration: BoxDecoration(
       image: const DecorationImage(image: AssetImage('assets/images/pic5.jpg',),fit: BoxFit.cover),
        // color: background,
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //    //green2,
        //    button_background,
        //    green1,
        //   //gcolor1,
        //   //gcolor2,
        // ]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff7090b0).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
          top: 40,
          bottom: 0,
          left: 0,
          right: 0,
          child: Stack(clipBehavior: Clip.none, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: purewhitebackground.withOpacity(1),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: pricetagbgcolor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                            
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("₱ 10000" , style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: purewhitebackground), ),
                            // Container(
                            //   height: 36,
                            //   width: 36,
                            //   child: Center(
                            //     child: FaIcon(FontAwesomeIcons.tags, size: 20, color:Colors.amber[600],),
                            //   ),
                            // ),
                            
                           
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text('Computer Services',
                      style: Get.textTheme.bodyText1!
                          .copyWith(fontWeight: FontWeight.bold)),
                          const VerticalSpace(height: 3),
                  Text(
                      'Pure grey never looks good (except pure black-white theme).', style: lightbody2.copyWith(color: Colors.grey[700],)),
                      const VerticalSpace(height: 8),
                  Container(                   
                    child: Row(
                      children: [
                        Container(

                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: input_background_ligt,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(child: FaIcon(FontAwesomeIcons.fileAlt, color: Colors.green,size: 16,))),
                        const HorizontalSpace(width: 5),
                         const Text('20')],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -30,
              left: 10,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  color: Colors.red,
                  border: Border.all(width: 2, color: purewhitebackground),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                    child: Image.asset(
                  'assets/images/pic1.jpg',
                  fit: BoxFit.cover,
                )),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
