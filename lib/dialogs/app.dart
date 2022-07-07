import 'package:eservice/dialogs/dialogwidgets/option_listtile.dart';
import 'package:eservice/screens/body/bodyscreens/profile_screen.dart';
import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class App {
 static void showChnageProfileOption(
      BuildContext context, Function pickimage) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.back();
                  pickimage(ImageSource.camera);
                },
                child: OptionListtile(
                    title: 'Take a Photo', icon: FontAwesomeIcons.camera),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.back();
                  pickimage(ImageSource.gallery);
                },
                child: OptionListtile(
                    title: 'Upload Photo', icon: FontAwesomeIcons.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
 static void showDatePicker(
          BuildContext context, DateTime datetimeinitial, Function getdate) =>
      showModalBottomSheet(
          context: context,
          builder: (context) => Container(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Container(
                                child: const Center(
                                  child: Icon(Icons.close, color: gcash_blue1,),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const VerticalSpace(height: 20),
                      SizedBox(
                        height: 140,
                        child: CupertinoDatePicker(
                          minimumYear: 1960,
                          initialDateTime: datetimeinitial,
                          maximumYear: DateTime.now().year,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (datetime) => getdate(datetime),
                        ),
                      ),
                      const VerticalSpace(height: 20),
                        Material(
   
                          child: InkWell(
                            onTap: (){
                                print('dasd');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: gcash_blue1,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              height: 40,
                              child: const Center(
                                child: Text('Done', style: TextStyle(color: purewhitebackground),),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ));

static void showChecker(BuildContext context, String message){
    showDialog(context: context, builder: (context)=> Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          TextButton(onPressed: (){
              Get.back();
          }, child: Text('Ok'))
        ],
      ),
    ));
}
static void showError({String? title = "Ops", String? description ="Something went wrong"}){

      Get.dialog(
        Dialog(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              
                  mainAxisSize: MainAxisSize.min,
                  children: [
            Text(title ?? ''),
            Text(description?? ''),
            TextButton(onPressed: (){
                Get.back();
            }, child: Text('Ok'))
                  ],
                ),
          ),
        )
      );
}

static void showCuperTinoDate(BuildContext context, Function setDate,Function setBirthDate, ){
  showModalBottomSheet(context: context, builder: (context)=> Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

              IconButton(onPressed: (){
                Get.back();
              }, icon:   Icon(Icons.close, size: 24, color: gcash_blue1,))
          ],
        ),
        VerticalSpace(height: 8),
        Padding(
        padding: const EdgeInsets.symmetric( horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 140,
                width: MediaQuery.of(context).size.width,
                 child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  minimumYear: 1961,
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (value){
                     setDate(value);
                 }),
               ),
               VerticalSpace(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width  * 0.90,
                          child: ElevatedButton(
                            onPressed: () {
                              setBirthDate();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                'OK',
                                style: lightheadline6.copyWith(fontSize: 18),
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(gcash_blue1),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(buttoncircular),
                                ))),
                          ),
                        ),
            ],
          ),
        ),
         VerticalSpace(height: 24)
    ],
  ));
}
 static void profileDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed: () {
                  Get.back();
                  Get.to(() => const ProfileScreen(),
                      transition: Transition.downToUp);
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: bodywhitebackground3,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      'assets/images/profile.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const HorizontalSpace(width: 6),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'My Profile',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      'Brian Orbino'.toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    Text(
                                      '+63088237781'.toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                margin: const EdgeInsets.only(right: 12),
                                child: const Center(
                                    child: FaIcon(
                                  FontAwesomeIcons.angleRight,
                                  color: Colors.black,
                                  size: 18,
                                )))
                          ],
                        ),
                      ),
                      const VerticalSpace(height: 12),
                      const Text(
                        '1.0.02',
                        style: TextStyle(fontSize: 13, color: unselected_gray),
                      )
                    ],
                  ),
                )),
            CupertinoActionSheetAction(
                onPressed: () {},
                child: const Text(
                  'Logout',
                  style: TextStyle(color: gcash_blue1),
                )),
          ],
          cancelButton: Container(
            child: CupertinoActionSheetAction(
                onPressed: () {
                  Get.back();
                },
                child: Container(
                    child: const Text(
                  'Cancel',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
          )),
    );
  }
}