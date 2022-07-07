
import 'package:eservice/screens/body/widgets/home/header_section_widget.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AllServices extends StatelessWidget {
const AllServices({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) =>  MultiSliver(pushPinnedChildren: true, children: [
        const SliverPinnedHeader(child: HeaderSectionWidget(title: 'Top Services')),
          SliverList(delegate: SliverChildBuilderDelegate((context, index)=>  Container(
            height: 200,
            margin: const EdgeInsets.symmetric(vertical: 5,),
            decoration: BoxDecoration(
           boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ],
            color: purewhitebackground,
            ),
          ))),

        
      ]);
}