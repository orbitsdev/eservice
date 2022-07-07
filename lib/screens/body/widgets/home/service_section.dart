import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ServiceSection extends StatelessWidget {
const ServiceSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiSliver(
    children: [

      const SizedBox(height: 30,
      child: Text('data'),
      ),
        ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index)=>  Container(
            height: 50,
            color: Colors.blueAccent.withOpacity(0.6),
            child: const Text('data'),
          ))
    ],
  );
}