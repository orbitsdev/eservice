import 'package:eservice/screens/body/widgets/home/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ServicesListBuilder extends StatelessWidget {
  const ServicesListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: AnimationLimiter(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 700),
                child:  const ScaleAnimation(
                  child: FadeInAnimation(
                    child: ServiceCard(image: 'assets/images/pic1.jpg',),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
