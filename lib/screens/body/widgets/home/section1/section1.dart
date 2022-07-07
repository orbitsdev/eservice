import 'package:eservice/dialogs/app.dart';
import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: gcash_blue1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logoProfileBuilder(context),
            welcomingBuilder(),
            const VerticalSpace(height: 30),
          ],
        ));
  }

  Padding welcomingBuilder() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: horizontalpadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'Hi, Kath 👋',
              style: TextStyle(color: purewhitebackground, fontSize: 40),
            ),
            const Text(
              'What are you looking for?',
              style: TextStyle(
                color: purewhitebackground,
              ),
            ),
          ],
        ),
      );

  Container logoProfileBuilder(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: horizontalpadding, vertical: 16),
        color: gcash_blue1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/layer.png',
                  width: 34,
                  height: 34,
                ),
                const HorizontalSpace(width: 6),
                const Text(
                  'E-service',
                  style: TextStyle(color: purewhitebackground),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ClipOval(
                    child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.bell,
                            color: purewhitebackground,
                          ),
                        ))),
                const HorizontalSpace(width: 14),
                GestureDetector(
                  onTap: (){
                       App.profileDialog(context);
                   
                  },
                  child: ClipOval(
                    child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: Image.asset(
                            'assets/images/profile.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      );
}
