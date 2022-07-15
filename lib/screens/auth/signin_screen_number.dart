import 'package:eservice/constant/controllers.dart';
import 'package:eservice/screens/auth/controller/authcontroller.dart';
import 'package:eservice/screens/auth/terms_and_condition.dart';
import 'package:eservice/screens/auth/widgets/info_icon.dart';
import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SigninScreenNumber extends StatefulWidget {
  const SigninScreenNumber({Key? key}) : super(key: key);

  @override
  State<SigninScreenNumber> createState() => _SigninScreenNumberState();
}

class _SigninScreenNumberState extends State<SigninScreenNumber> {
  var phonenumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    phonenumber.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    phonenumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: FaIcon(FontAwesomeIcons.angleLeft, color:gcash_blue1, )),
      ),
      backgroundColor: purewhitebackground,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          VerticalSpace(height: MediaQuery.of(context).size.height * 0.03),
          Container(
            child: Image.asset('assets/images/layer.png', height: 90, width: 90,),
          ),
          Text(
            'Eservice'.toUpperCase(),
            style: TextStyle(
                fontSize: 24, color: gcash_blue1, fontWeight: FontWeight.bold),
          ),
          VerticalSpace(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 61,
                  width: 61,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: input_background_ligt,
                  ),
                  child: Center(
                      child: Text(
                    '+63',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ))),
              Expanded(
                child: TextFormField(
                  controller: phonenumber,
                  onChanged: (value){
                    authcontroller.phonenumber =  value;
                  },
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
               
                
                  inputFormatters: [
                     LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if(phonenumber.text.isNotEmpty)
                        IconButton(
                            onPressed: () {
                              phonenumber.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    filled: true,
                    hintText: 'Phone number',
                    hintStyle: TextStyle(
                        color: Colors.grey[500], fontWeight: FontWeight.normal),
                    fillColor: input_background_ligt,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black12)),
                  ),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ],
          ),
           const VerticalSpace(height: 16),
            if (phonenumber.text.length == 10)
                InfoIcon(icon: FontAwesomeIcons.check, color: Colors.green[600], message: 'Everything seems good'),
                 
                if (phonenumber.text != "" &&
                    phonenumber.text.length != 10)
                InfoIcon(icon: FontAwesomeIcons.exclamationCircle, color: Colors.red[400], message: 'Invalid number length'),
           
          //   TextFormField(
          //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          //   onChanged: (value) {

          //   },
          //   controller: phonenumber,
          //   maxLength: 10,
          //   textAlignVertical: TextAlignVertical.center,
          //   keyboardType: TextInputType.phone,
          //   textInputAction: TextInputAction.done,
          //   decoration: InputDecoration(

          //       border: UnderlineInputBorder(
          //         borderSide: BorderSide(
          //           color: Colors.white
          //         )
          //       ),
          //       isDense: true,
          //       prefixIcon: Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Image.asset(
          //             'assets/images/philippines.png',
          //             width: 34,
          //             height: 34,
          //           ),
          //           HorizontalSpace(width: 6),
          //           Text('+63'),
          //           HorizontalSpace(width: 8),
          //         ],
          //       )),
          // ),
          VerticalSpace(height: 24),
        ]),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatingBuilder(context));
    
  }

  Widget floatingBuilder(BuildContext context) {
    return  Obx((){

     
      return Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24,),
          child: Column(
             mainAxisSize: MainAxisSize.min,
            children: [

              authcontroller.isSendingVerification.isTrue
               ?
               Container(
                      child: Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: gcash_blue1,
                          ),
                        ),
                      ),
                    )
               : 
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                              onPressed: () { 
                                authcontroller.sendVerification(phonenumber.text, ProcessType.login);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                child: Text( "Login",
                                  style: lightheadline6.copyWith(fontSize: 18),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(gcash_blue1),
                                  shape:
                                      MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(buttoncircular),
                                  ))),
                            ),
              ),
              VerticalSpace(height: 8),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(
                    'Don\'t have account?',
                    style: Get.textTheme.subtitle1!
                        .copyWith(fontSize: 13, color: gcash_blue1),
                  ),
                  HorizontalSpace(width: 4),
               GestureDetector(
                  onTap: () {
                    Get.to(()=> const TermsAndCondition());
                  },
                  child: Text(
                    'Signup',
                    style: Get.textTheme.subtitle1!
                        .copyWith(fontSize: 13, color: gcash_blue1, fontWeight: FontWeight.bold),
                  ),
                ),
             ],
           ),
            ],
          ),
        ),
      );});
    }
    
    
    
    
  
}
