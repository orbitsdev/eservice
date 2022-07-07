
import 'package:eservice/screens/body/widgets/home/header_section_widget.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliver_tools/sliver_tools.dart';

class TopServiceSection extends StatelessWidget {
  const TopServiceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      MultiSliver(pushPinnedChildren: true, children: [
        const SliverPinnedHeader(child:  HeaderSectionWidget(title: 'All Services')),
        SliverToBoxAdapter(
          child: Container(
            height: 240,
            color: bodywhitebackground3,
            child: Scrollbar(
              radius: const Radius.circular(8),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) => Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        color: purewhitebackground,
                        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 155,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/pic4.jpg'),
                                      fit: BoxFit.cover)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      color: purewhitebackground,
                                  
                                      width: 34,
                                      child: Column(
                                        children: const [
                                          FaIcon(FontAwesomeIcons.fire,
                                              color: Colors.red),
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 3),
                                                child: Text('Top'),
                                              )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const VerticalSpace(height: 6),
                                  const Text('Aircon Installation'),
                                  const VerticalSpace(height: 3),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('₱ 1500', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                                      ClipOval(
                                        
                                        child: Container(
                                          height:24,
                                          width: 24,
                                          color: green1,
                                          child: const Center(child: FaIcon(FontAwesomeIcons.airbnb, color: purewhitebackground, size: 14,)),
                                          
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
            ),
          ),
        )
      ]);


}
