import 'package:flutter/material.dart';

class DefaultDropdown extends StatelessWidget {

  final String name;

  const DefaultDropdown({super.key, required this.name});
  
  

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: 'null',
                    style: TextStyle(
                        color: Colors.black, overflow: TextOverflow.ellipsis),
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                            value:'null',
                            child: Text(
                              '${name}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(),
                            ),),
                    ],
                    onChanged: (value) {
                    
                    },
                  ),
                );
  }
}
