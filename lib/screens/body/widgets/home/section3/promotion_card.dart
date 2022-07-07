import 'package:eservice/model/promotion.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';

class PromotionCard extends StatefulWidget {
  const PromotionCard({ Key? key }) : super(key: key);

  @override
  State<PromotionCard> createState() => _PromotionCardState();
}

class _PromotionCardState extends State<PromotionCard> {
ScrollController promoScrollController = ScrollController();


@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      double minScrollExtent = promoScrollController.position.minScrollExtent; 
      double maxScrollExtent = promoScrollController.position.maxScrollExtent;
      animateToMin(maxScrollExtent,minScrollExtent, 100,1, promoScrollController ); 
    });

  }

   animateToMin (double max, double min,double direction, int seconds, ScrollController scrollConntroller){
        scrollConntroller.animateTo(direction, duration: Duration(seconds: seconds), curve: Curves.linear);

   } 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
               const VerticalSpace(height: 4),
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 12,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
         
              Text('Promo', style: TextStyle(
                fontWeight: FontWeight.bold
              
              ),),
            Text('View all', style: TextStyle(color: gcash_blue1),)
            ],
          ),
        ),
        const VerticalSpace(height: 6),
           const Padding(
              padding: EdgeInsets.symmetric(horizontal:12,),
              child: Text('E service thesis maker is coming soon', style: TextStyle(
                fontSize: 13
                ),),
            ),
        const VerticalSpace(height: 8),
        Container(

              decoration: BoxDecoration(

                   borderRadius: BorderRadius.circular(8),
              ),
            height: 238,
            child: Scrollbar(
              radius: const Radius.circular(8),
              child: ListView.builder(
                controller: promoScrollController,
                itemCount: listofpromotion.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=> Container(
                  
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: AssetImage(listofpromotion[index].image,), fit: BoxFit.cover),
                  boxShadow: const [
                         //BoxShadow
                          BoxShadow(
                            color: gcash_blue3,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                ),
               margin: const EdgeInsets.only(top: 0, right: 6, left: 6, bottom: 10),
                height: 100,
                width: MediaQuery.of(context).size.width / 1.1,
              )),
            ), 
         ),
      ],
    );
  }
}