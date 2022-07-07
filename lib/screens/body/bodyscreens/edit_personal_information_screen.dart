
import 'package:eservice/dialogs/app.dart';
import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class EditPersonalInformationScreen extends StatefulWidget {
  const EditPersonalInformationScreen({Key? key}) : super(key: key);
  static const String screenName = "/editpersonalinformation";

  @override
  State<EditPersonalInformationScreen> createState() =>
      _EditPersonalInformationScreenState();
}

class _EditPersonalInformationScreenState extends State<EditPersonalInformationScreen> {
  
  DateTime  dateTIme = DateTime.now();

  void setDate(DateTime passdate){
    dateTIme  = passdate;
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: gcash_blue1,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const FaIcon(FontAwesomeIcons.angleLeft),
          ),
          title: const Text('Change Personal Information'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 0,
                ),
                decoration: BoxDecoration(
                    color: gcash_blue7, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.exclamationCircle,
                      color: gcash_blue1,
                    ),
                    const HorizontalSpace(width: 6),
                    Flexible(
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: 'Note: ',
                            style: TextStyle(
                                color: gcash_blue1,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: 'Please use real name instead of made up user name',
                            style: TextStyle(
                              color: gcash_blue1,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                height: 60,
                padding: const EdgeInsets.all(8),
              ),
              const VerticalSpace(height: 8),
              Text(
                'Basic Details'.toUpperCase(),
                style: const TextStyle(
                  color: gcash_blue1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'First name',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const VerticalSpace(height: 12),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Last name',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const VerticalSpace(height: 12),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.phone,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
                  
              GestureDetector(
                onTap: (){
                   App.showDatePicker(context, dateTIme, setDate);
                },
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('mm/dd/yyyy', style: TextStyle(color: Colors.grey[600], fontSize: 14),),const HorizontalSpace(width: 6),
                      const SizedBox(
                        height: 34,
                        width: 34,
                        child: FaIcon(FontAwesomeIcons.calendarAlt, color: gcash_blue1,),
                      )
                    ],
                  ),
                ),
              )
                // ElevatedButton(onPressed: (){
                //   AppDialog.showDatePicker(context, dateTIme, setDate);
                // }, child: Text('Selecte date')),
              
             
            ],
          )),
        ),
      ),
    );
  }
}
