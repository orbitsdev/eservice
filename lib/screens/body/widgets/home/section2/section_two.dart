
import 'package:eservice/screens/body/widgets/home/section2/pageview/page_one_services.dart';
import 'package:eservice/screens/body/widgets/home/section2/pageview/page_two_services.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SectionTwo extends StatefulWidget {
  const SectionTwo({Key? key}) : super(key: key);

  @override
  State<SectionTwo> createState() => _SectionTwoState();
}

class _SectionTwoState extends State<SectionTwo> {
  final PageController servicepageController = PageController();
  final int servicePageIndex= 2;
  String  _dropDownvalue = 'Isulan';

  void dropDownCallBack(String?  selectedValue){
    if(selectedValue is String){
      setState(() {
        _dropDownvalue = selectedValue;
        
      });
    }
  } 
  @override
  Widget build(BuildContext context) {
    return Container( 

      padding: const EdgeInsets.only(top: 8,left: 20, right: 20),  
      child: Stack(
        clipBehavior: Clip.none,
        children:[ 
          
          Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VerticalSpace(height: 30),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: PageView(
                controller: servicepageController,
                children: const [
                    PageOneServices(),
                    PageTwoServices(),
                ],
              ),
            ),
            smoothIndicatorBuilder(),
            const VerticalSpace(height: 12),
            
            
          ],
        ),
        
          // Positioned(
          //   top: -40,
          //   right: 0,
          //   left: 0,
          //   child: Container(
          //     padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16,),
          //     height: 60,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(6),
          //     color: purewhitebackground,
          //     boxShadow: [
          //       BoxShadow(
          //         blurRadius: 6,
          //         spreadRadius: 0,
          //         offset: Offset(0, 2),
          //         color: gcash_blue1.withOpacity(0.2)
          //       )
          //     ]
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //           FaIcon(FontAwesomeIcons.brain, color: gcash_blue1,), 
          //         HorizontalSpace(width: 8),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text('Coming soon', overflow:  TextOverflow.ellipsis, style: TextStyle(),),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ]
      ),
    );

  }

  Container smoothIndicatorBuilder() => Container(
          height: 20,
          padding: const EdgeInsets.symmetric(vertical: 4,),
          child: Center(
            child: SmoothPageIndicator(
                controller: servicepageController, // PageController
                count: servicePageIndex,
                effect: const ScrollingDotsEffect(
                  dotColor: gray_n1,
                  activeDotColor: gcash_blue4,
                  dotHeight: 6,
                  dotWidth: 6,
                ), // your preferred effect
                onDotClicked: (index) {}),
          ),
        );
  
}
