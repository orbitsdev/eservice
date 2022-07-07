
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';

class SubserviceListbuilder extends StatelessWidget {
  const SubserviceListbuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
        color: bodywhitebackground3,
        height: 280,
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical:5, horizontal: 5,),
                  decoration: const BoxDecoration(color: purewhitebackground),
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/pic1.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.red,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 5,
                              left: 5,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.pink,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width),
                                    child: const Text(
                                      'P 450',
                                      style:
                                          TextStyle(fontSize: 14, color: purewhitebackground),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      const VerticalSpace(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0,),
                        child: Column(
                          children: [
                            const Text(
                              'Computer Formating',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const VerticalSpace(height: 4),
                            Text(
                              'The produc is hadnle by ur proffesional expert',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[500]),
                            ),
                            const VerticalSpace(height: 8),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Container(
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(100)),
                            //       padding: EdgeInsets.all(6),
                            //       child: Row(
                            //         children: [
                            //           FaIcon(
                            //             FontAwesomeIcons.laptop,
                            //             color: green1,
                            //             size: 14,
                            //           ),
                            //           HorizontalSpace(width: 4),
                            //           Text(
                            //             'Computer',
                            //             style: TextStyle(fontSize: 13),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Container(
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(100)),
                            //       padding: EdgeInsets.all(6),
                            //       child: Row(
                            //         children: [
                            //           FaIcon(
                            //             FontAwesomeIcons.fire,
                            //             color: Colors.redAccent,
                            //             size: 14,
                            //           ),
                            //           HorizontalSpace(width: 4),
                            //           Text(
                            //             'Top Sales',
                            //             style: TextStyle(fontSize: 13),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
