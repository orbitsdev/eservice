
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchServicesScreen extends StatelessWidget {
  const SearchServicesScreen({Key? key}) : super(key: key);
  static const String screenName = "/searchservices";
  @override
  Widget build(BuildContext context) =>
   Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(screenPadding),
              height: 100,
              color: purewhitebackground,
              child:  Center(
                child: TextField(
                  
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                      
                      contentPadding: const EdgeInsets.all(16),
                        suffixIcon: IconButton(
                                onPressed: () {
                          
                                },
                                icon: FaIcon(
                                  Icons.search,
                                  color: Colors.grey[600],
                                )),
                        hintText: 'Search Services',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        filled: true,
                        fillColor: input_background_ligt,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(inputradius)),
                          borderSide: BorderSide.none,
                        ),
                        label: Text('Email', style: lightbody1),
                        labelStyle: lightbody2,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(inputradius)),
                          borderSide: BorderSide(
                            color: input__icon_background,
                          ),
                        ),
                      ),
                      style: lightbody1,
                    ),
              ),
       
              ),
              Expanded(
                child: Container(
                  
                  constraints: const BoxConstraints(
                    minHeight: 20
                  ),
                  color: bodywhitebackground3,
                    child: AnimationLimiter(
      
                      child: MasonryGridView.count(
                        itemCount: 20,
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                         itemBuilder: (context,index)=> AnimationConfiguration.staggeredGrid(
                        duration: const Duration(milliseconds: 700),
                           position: index, columnCount:2, child: Container(
                            
                              color: purewhitebackground,
                              child: ScaleAnimation(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                               
                                    Container(
                                     constraints: const BoxConstraints(
                                       minHeight: 160,
                                     ),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/images/pic2.jpg'),fit:  BoxFit.cover)
                                      ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(6),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const VerticalSpace(height: 3),
                                          Text('Computer Services', style: lightbody2.copyWith(fontSize: 16, color: button_background, fontWeight: FontWeight.w600),),
                                          const VerticalSpace(height: 6),
                                          Text('We offer hardware and software services such', style: Get.textTheme.subtitle2!.copyWith(fontSize:14, fontWeight: FontWeight.normal),),
                                          const VerticalSpace(height: 4),
                                         
                                          Text('Available 24', style: Get.textTheme.subtitle2!.copyWith(fontSize:13, fontWeight: FontWeight.normal, color: grey3),),



                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                                               ),)
                         )),
                    ),
                ),
              
          ],
        ),
      ),
    );
  
}
