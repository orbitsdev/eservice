import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';

class BlueCard extends StatelessWidget {

final String content;

  const BlueCard({super.key, required this.content});
  @override
  Widget build(BuildContext context){
    return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    color: gcash_blue8,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(content,style: TextStyle(fontSize: 13, color: gcash_blue1, ),)
                        
                      ],
                    ),
                  );
  }
}