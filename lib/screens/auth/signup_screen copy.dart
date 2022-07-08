import 'package:eservice/dialogs/app.dart';
import 'package:eservice/screens/auth/controller/authcontroller.dart';
import 'package:eservice/screens/auth/terms_and_condition.dart';
import 'package:eservice/screens/auth/widgets/datefieldcontent.dart';
import 'package:eservice/screens/auth/widgets/default_dropdown.dart';
import 'package:eservice/screens/auth/widgets/textfield.dart';
import 'package:eservice/screens/widgets/blue_card.dart';
import 'package:eservice/screens/widgets/horizontal_space.dart';
import 'package:eservice/screens/widgets/vertical_space.dart';
import 'package:eservice/screens/widgets/whit_line.dart';
import 'package:eservice/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with TickerProviderStateMixin {
  var authcontroller = Get.put(Authcontroller());
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController middlename = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retypepassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _showPassword = true;
  bool _showRetypePassword = true;
  DateTime? date;
  DateTime? birthday;
  final pagecontroller = PageController(initialPage: 0);
  int pageindex = 0;

  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  @override
  void initState() {
    firstname.addListener(onListen);
    lastname.addListener(onListen);
    phonenumber.addListener(onListen);
    email.addListener(onListen);
    password.addListener(onListen);
    retypepassword.addListener(onListen);

    super.initState();
  }

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    phonenumber.dispose();
    email.dispose();
    password.dispose();
    retypepassword.dispose();
    pagecontroller.dispose();
    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    var mediquery = MediaQuery.of(context);
    double? appbarsize = mediquery.padding.top + AppBar().preferredSize.height + 50;
    double? containersize = mediquery.size.height - appbarsize ;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: gcash_blue1,
          title: const Text('Sign up'),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const FaIcon(FontAwesomeIcons.angleLeft,
                  color: purewhitebackground)),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: screenPadding,
            horizontal: 25,
          ),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                        controller: pagecontroller,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                            spacing: 8,
                            dotColor: input_background_ligt,
                            activeDotColor: gcash_blue1)),
                    Container(
                      child: Text(
                        '${pageindex + 1}/3',
                        style: Get.textTheme.bodyText1!.copyWith(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            color: gcash_blue1),
                      ),
                    ),
                  ],
                ),
                Container(
                  height:containersize != null ? containersize :300 ,
                  child: PageView(
                    onPageChanged: (int index) {
                      setState(() {
                        pageindex = index;
                      });
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pagecontroller,
                    children: [
                      firstStepBuilder(),
                      secondStepBuilder(),
                      thirStepBuilder()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatingButtonBuilder(),
      ),
    );
  }

  Container floatingButtonBuilder() {
    return Container(
      color: const Color(0xffFFFFFF),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                AnimatedSwitcher(
                  transitionBuilder: ((child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  }),
                  duration: const Duration(milliseconds: 300),
                  child: pageindex != 0
                      ? SizedBox(
                          key: const Key('k1'),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.grey[400],
                            ),
                            onPressed: () {
                              pagecontroller.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            },
                            label: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                'Previous',
                                style: lightheadline6.copyWith(
                                    fontSize: 18, color: Colors.grey[400]),
                              ),
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(
                                    input_background_ligt),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(buttoncircular),
                                ))),
                          ),
                        )
                      : Container(
                          key: const Key('k2'),
                        ),
                ),
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        checkAndProceed();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'Continue',
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
                ),
              ],
            ),
            const VerticalSpace(height: 16),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                'Login to your existing account',
                style: Get.textTheme.subtitle1!
                    .copyWith(fontSize: 13, color: gcash_blue1),
              ),
            ),
            const VerticalSpace(height: 6),
          ],
        ),
      ),
    );
  }

  void checkAndProceed() {
    switch (pageindex) {
      case 0:
        // if(firstname.text.isEmpty || lastname.text.isEmpty || date
        // == null ){
        //   App.showChecker(context, 'Please fill out all fields before pressiong continue');
        // }else{
        //      proceed();
        // }
        proceed();
        break;

      case 1:
        if (authcontroller.region == null ||
            authcontroller.province == null ||
            authcontroller.city == null ||
            authcontroller.barangay == null) {
          App.showChecker(
              context, 'Please fill out all fields before pressiong continue');
        } else {
          proceed();
        }

        break;

      case 2:
        Get.to(()=> TermsAndCondition(),);
        break;
    }

    //check page 3
    // if (pageindex >= 2) {
    //   Get.to(
    //     () => const TermsAndCondition(),
    //     fullscreenDialog: true,
    //   );
    // }
    // //check first step
    // if (pageindex == 0) {
    //   if (firstname.text.isEmpty && lastname.text.isEmpty && birthday == null) {
    //   } else {}
    // }

    //check page 1
  }

  void proceed() {
    pagecontroller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  Container thirStepBuilder() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(height: 24),
            Text('Login Number'.toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[900])),
            const VerticalSpace(height: 8),

            // Container(
            //   margin: EdgeInsets.only(bottom: 5),
            //   height: 200,
            //   color: Colors.red,
            //   width: double.infinity,
            // ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 5),
            //   height: 200,
            //   color: Colors.red,
            //   width: double.infinity,
            // ),
            VerticalSpace(height: 24),

            Column(
              children: [

                Lottie.asset('assets/images/97981-hand-holding-phone.json', height: 170),
                VerticalSpace(height: 24),
                Text('We will send you an One Time Password '),
                Text(
                  'Enter Mobile Phone',
                  style: TextStyle(color: Colors.grey[500]),
                ),
                // Image.asset(
                //   'assets/images/philippines.png',
                //   width: 34,
                //   height: 34,
                // ),
            TextField(
            textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        
        isDense: true,

        prefixIcon: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
              Image.asset(
                'assets/images/philippines.png',
                width: 34,
                height: 34,
              ),
              HorizontalSpace(width: 6),
            Text('+63'),
              HorizontalSpace(width: 8),
            
          ],
        )
      ),
    
               
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              height: 200,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              height: 200,
              width: double.infinity,
            ),

         

            // const VerticalSpace(height: 12),
            // TextFormField(
            //   obscureText: _showPassword,
            //   controller: password,
            //   textInputAction: TextInputAction.next,
            //   keyboardType: TextInputType.text,
            //   autocorrect: false,
            //   decoration: InputDecoration(
            //     suffixIcon: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         if (password.text.isNotEmpty)
            //           IconButton(
            //               onPressed: () {
            //                 password.clear();
            //               },
            //               icon: const Icon(
            //                 Icons.close,
            //                 color: Colors.black,
            //               )),
            //         IconButton(
            //             onPressed: () {
            //               setState(() => _showPassword = !_showPassword);
            //             },
            //             icon: FaIcon(
            //               _showPassword
            //                   ? FontAwesomeIcons.eyeSlash
            //                   : FontAwesomeIcons.eye,
            //               color: Colors.black,
            //             )),
            //       ],
            //     ),
            //     filled: true,
            //     hintText: 'Password',
            //     hintStyle: TextStyle(
            //         color: Colors.grey[500], fontWeight: FontWeight.normal),
            //     fillColor: input_background_ligt,
            //     enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(16),
            //         borderSide: BorderSide.none),
            //     focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(16),
            //         borderSide: const BorderSide(color: Colors.black12)),
            //   ),
            //   style: const TextStyle(fontWeight: FontWeight.w600),
            // ),
            // const VerticalSpace(height: 12),
            // TextFormField(
            //   obscureText: _showRetypePassword,
            //   controller: retypepassword,
            //   textInputAction: TextInputAction.done,
            //   keyboardType: TextInputType.text,
            //   autocorrect: false,
            //   decoration: InputDecoration(
            //     suffixIcon: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         if (retypepassword.text.isNotEmpty)
            //           IconButton(
            //               onPressed: () {
            //                 retypepassword.clear();
            //               },
            //               icon: const Icon(
            //                 Icons.close,
            //                 color: Colors.black,
            //               )),
            //         IconButton(
            //             onPressed: () {
            //               setState(
            //                   () => _showRetypePassword = !_showRetypePassword);
            //             },
            //             icon: FaIcon(
            //               _showRetypePassword
            //                   ? FontAwesomeIcons.eyeSlash
            //                   : FontAwesomeIcons.eye,
            //               color: Colors.black,
            //             )),
            //       ],
            //     ),
            //     filled: true,
            //     hintText: 'Retype password',
            //     hintStyle: TextStyle(
            //         color: Colors.grey[500], fontWeight: FontWeight.normal),
            //     fillColor: input_background_ligt,
            //     enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(16),
            //         borderSide: BorderSide.none),
            //     focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(16),
            //         borderSide: const BorderSide(color: Colors.black12)),
            //   ),
            //   style: const TextStyle(fontWeight: FontWeight.w600),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //       'Make sure to input a valid email , we will send verification link to verify your account',
            //       style: Get.textTheme.subtitle2!.copyWith(
            //           fontSize: 13,
            //           color: gcash_blue1,
            //           fontWeight: FontWeight.normal)),
            // ),
          ],
        ),
      ),
    );
  }

  Widget secondStepBuilder() {
    return GetBuilder<Authcontroller>(
      builder: (controller) {
        if (authcontroller.regions.length == 0) {
          return Column(
            children: [
              VerticalSpace(height: 24),
              Container(
                height: 260,
                child: Image.asset(
                  'assets/images/pngegg.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                      color: gcash_blue1,
                    )),
                    onPressed: () {
                      controller.getRegions();
                    },
                    child: Text('Retry'.toUpperCase())),
              ),
            ],
          );
        }
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VerticalSpace(height: 24),
              Text('Adress Details'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[900])),
              const VerticalSpace(height: 8),

              //if(controller.province==null)
              BlueCard(
                  content:
                      'Select region , province, city, and baranggay before proceedigng the next step. '),

              WhitLine(thickness: 2),
              Row(
                children: [
                  Container(
                    height: 40,
                    child: Image.asset(
                      'assets/images/philippines.png',
                    ),
                  ),
                  HorizontalSpace(width: 6),
                  Text('Philippines')
                ],
              ),

              VerticalSpace(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: input_background_ligt,
                ),
                child: DropdownButtonHideUnderline(
                  child: controller.region == null
                      ? DefaultDropdown(name: 'Region')
                      : DropdownButton(
                          value: controller.region!.name,
                          style: TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis),
                          isExpanded: true,
                          items: controller.regions
                              .map(
                                (element) => DropdownMenuItem(
                                  value: element.name,
                                  child: Text(
                                    '${element.name}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            controller.setNewRegion(value.toString());
                          },
                        ),
                ),
              ),
              VerticalSpace(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: input_background_ligt,
                ),
                child: DropdownButtonHideUnderline(
                  child: controller.provinces.length == 0
                      ? DefaultDropdown(name: 'Province')
                      : controller.provinces == null
                          ? DefaultDropdown(name: 'Province')
                          : DropdownButton(
                              value: controller.province!.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis),
                              isExpanded: true,
                              items: controller.provinces
                                  .map(
                                    (element) => DropdownMenuItem(
                                      value: element.name,
                                      child: Text(
                                        '${element.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                controller.setNewProvince(value.toString());
                              },
                            ),
                ),
              ),
              VerticalSpace(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: input_background_ligt,
                ),
                child: DropdownButtonHideUnderline(
                  child: controller.cities.length == 0
                      ? DefaultDropdown(name: 'City')
                      : controller.city == null
                          ? DefaultDropdown(name: 'City')
                          : DropdownButton(
                              value: controller.city!.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis),
                              isExpanded: true,
                              items: controller.cities
                                  .map(
                                    (element) => DropdownMenuItem(
                                      value: element.name,
                                      child: Text(
                                        '${element.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                controller.setNewCity(value.toString());
                              },
                            ),
                ),
              ),
              VerticalSpace(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: input_background_ligt,
                ),
                child: DropdownButtonHideUnderline(
                  child: controller.barangays.length == 0
                      ? DefaultDropdown(name: 'Barangay')
                      : controller.city == null
                          ? DefaultDropdown(name: 'Barangay')
                          : DropdownButton(
                              value: controller.barangay!.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis),
                              isExpanded: true,
                              items: controller.barangays
                                  .map(
                                    (element) => DropdownMenuItem(
                                      value: element.name,
                                      child: Text(
                                        '${element.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                controller.setNewBaranggay(value.toString());
                              },
                            ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget firstStepBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpace(height: 24),
        Text('Basic Details'.toUpperCase(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[900])),
        const VerticalSpace(height: 24),
        Textfield(
            controller: firstname,
            type: TextInputType.text,
            action: TextInputAction.next,
            label: 'First name'),
        const VerticalSpace(height: 8),
        Textfield(
            controller: lastname,
            type: TextInputType.text,
            action: TextInputAction.next,
            label: 'Last name'),
        const VerticalSpace(height: 8),
        InkWell(
          onTap: () => App.showCuperTinoDate(context, setDate, setBirthDate),
          child: datefieldBuilder(),
        )
      ],
    );
  }

  Widget datefieldBuilder() => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: input_background_ligt,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Birthdate',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            birthday == null
                ? const Datefieldcontent(text: 'mm/dd/yyyy')
                : Datefieldcontent(
                    text: DateFormat.yMMMd().format(DateTime.now()))
          ],
        ),
      );

  void setDate(DateTime value) {
    setState(() {
      date = value;
    });
    print(date.toString());
  }

  void setBirthDate() {
    setState(() {
      birthday = date;
    });

    Get.back();
  }
}
