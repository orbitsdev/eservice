import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchServicesInput extends StatelessWidget {
const SearchServicesInput({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(

          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
              color: bodywhitebackground3,
              borderRadius: BorderRadius.circular(8)),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Search Services',
                  style: TextStyle(color: Colors.grey[700])),
              Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Center(
                      child: FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.grey[700],
                    size: 16,
                  )))
            ],
          ),
        ),
      ],
    );
  }
}