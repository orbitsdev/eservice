import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:eservice/theme/theme_constant.dart';

class Textfield extends StatelessWidget {


  final TextEditingController controller;
  final TextInputType type;
  final TextInputAction action;
  final String label;
  const Textfield({
    Key? key,
    required this.controller,
    required this.type,
    required this.action,
    required this.label,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context){
    return TextFormField(
          controller: controller,
          textInputAction: action,
          keyboardType:type,
          autocorrect: false,
          decoration: InputDecoration(
            filled: true,
            hintText: label,
            hintStyle: TextStyle(color: Colors.grey[500] , fontWeight: FontWeight.w300),
            fillColor: input_background_ligt,
            suffixIcon: controller.text.isEmpty
                ? null
                : IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: gcash_blue1,
                    )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.black12)),
          ),
          
        );
  }
}
