
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceIconTitle extends StatelessWidget {

  final String title;
  final IconData icon;
  const ServiceIconTitle({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: const BoxConstraints(
      minHeight: 80,
      maxWidth: 70
    ),
    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        ClipOval(
                          child: Container(
                            
                            width: 38,
                            height: 38,
                            color: gcash_blue3,
                        
                            child: Center(child: FaIcon(icon, size: 20, color: gcash_blue1  ,)),
                          ),
                        ),
                        const VerticalSpace(height: 14),
                        Container(
                          child: Center(child: Text(title, style: const TextStyle(fontSize: 12, color: unselected_gray, height: 0.90) ,textAlign: TextAlign.center,)))
                    ],
                  ),
                ),
  );
}
