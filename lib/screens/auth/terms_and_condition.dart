import 'package:eservice/screens/auth/otp_screen.dart';
import 'package:eservice/screens/body/app_main_screen.dart';
import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({ Key? key }) : super(key: key);

  @override
  _TermsAndConditionState createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {

   bool _isagree = false;
  @override
  Widget build(BuildContext context) {
 return  SafeArea(
      
      child: Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: (){
            Get.back();   
          }, icon: const Icon(Icons.close, color: gcash_blue1,),),      

        
      ),
        body: SingleChildScrollView(
          child: Column(
    
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: screenPadding,
                  horizontal: 30,
                ),
                constraints: const BoxConstraints(
                  
                ),
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Terms & Conditions',
                        style: Get.textTheme.headline6!
                            .copyWith(fontWeight: FontWeight.w600, color: gcash_blue1)),
                    const VerticalSpace(height: 8),
                    const Text('Read them carefully. By checking the checkbox, you acknowledge that you have read and agree to the following terms'),
                    const VerticalSpace(height: 24),
                    Container(
                      height: MediaQuery.of(context).size.height *0.55,
                      decoration: const BoxDecoration(
                          color: input_background_ligt,
                          borderRadius: BorderRadius.all(
                            Radius.circular(buttonreadius),
                          )),
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Column(
                          children: const [
                            Text(
                                "● To provide and maintain our Service, including to monitor the usage of our Service. ● To manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user. ● For the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service. ● To contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application's push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation. ● To provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information. ● To manage Your requests: To attend and manage Your requests to Us. ● For business transfers: We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred. ● For other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience. We may share Your personal information in the following situations: ● With Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, for payment processing, to contact You. ● For business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company. ● With Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us. ● With business partners: We may share Your information with Our business partners to offer You certain products, services or promotions. "),
                            VerticalSpace(height: 12),
                          ],
                        ),
                      ),
                    ),
                    const VerticalSpace(height: 24),
                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: gcash_blue1,
                                value: _isagree,
                                onChanged: (value) =>
                                    setState(() => _isagree = value as bool)),
                            const Text('I agree'),

                          ],
                        ),
                        const HorizontalSpace(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isagree ? (){
                                Get.to(()=> const OtpScreen(), transition: Transition.downToUp);
                            }: null,
                            child: Container(

                              padding: const EdgeInsets.symmetric( vertical: 12),
                              child: Center(
                                child: Text(
                                  'Create My Account',
                                  style: lightheadline6.copyWith(fontSize: 18),
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.5);
                                    } else if (states.contains(MaterialState.disabled)) {
                                      return Colors.grey.withOpacity(0.1);
                                    }
                                    return gcash_blue1;
                                  },
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(buttoncircular),
                                ))),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}