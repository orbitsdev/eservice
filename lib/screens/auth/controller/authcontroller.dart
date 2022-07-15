import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eservice/constant/fbase.dart';
import 'package:eservice/dialogs/app.dart';
import 'package:eservice/model/baranngay.dart';
import 'package:eservice/model/city.dart';
import 'package:eservice/model/province.dart';
import 'package:eservice/model/resgion.dart';
import 'package:eservice/model/user.dart' as model;
import 'package:eservice/screens/auth/otp_screen.dart';
import 'package:eservice/screens/body/app_main_screen.dart';
import 'package:eservice/screens/start_screen.dart';
import 'package:eservice/services/api.dart';
import 'package:eservice/services/api_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

enum ProcessType{
  login,
  signup

}
class Authcontroller extends GetxController with ApiHandler {
  static Authcontroller instance = Get.find();
  var regions = <Region>[].obs;
  var provinces = <Province>[].obs;
  var cities = <City>[].obs;
  var barangays = <Barangay>[].obs;
  var useraccount = model.User().obs;

  Region? region;
  Province? province;
  City? city;
  Barangay? barangay;

  String? firstname;
  String? lastname;
  String? birthday;
  String phonenumber = "";
  String verifyid = "";
  var isSendingVerification = false.obs;
  var isVerifyingPhoneNumber = false.obs;

  var isLoading = false.obs;
  String otpcode = "";



  void sendVerification(String phone, ProcessType processType) async {
    if (phone.length == 10 && phone.isNotEmpty) {
      phonenumber = "+63$phone";
      isSendingVerification(true);
      await auth.verifyPhoneNumber(
          phoneNumber: phonenumber,
          verificationCompleted: (PhoneAuthCredential phonescredential) async {
            isSendingVerification(false);
          },
          verificationFailed: (FirebaseAuthException e) async {
            App.showError(title: "Verificaion Error", description: e.message);
            isSendingVerification(false);
          },
          codeSent: (verificationId, resendingToken) async {
            
            print(resendingToken);
            verifyid = verificationId;
            Get.to(() => OtpScreen(process: processType,));
            isSendingVerification(false);
          },
          codeAutoRetrievalTimeout: (verificationId) async {},
          timeout: const Duration(seconds: 20));
    }else{
      App.showError(description: "Check your number seems like something is missing");
    }
  }



  void veriPhone(ProcessType processtype) async {
   
    isVerifyingPhoneNumber(true);
    PhoneAuthCredential phoneauthcredential = PhoneAuthProvider.credential( verificationId: verifyid, smsCode: otpcode);
    signInWithPhoneCredential(phoneauthcredential, processtype);

  }

  void signInWithPhoneCredential( PhoneAuthCredential phoneauthcredential, ProcessType processtype ) async {
    try {

      final authcredential =   await auth.signInWithCredential(phoneauthcredential);
    if (authcredential.user != null) {

          if(processtype ==  ProcessType.login){

            logInProcess(authcredential.user!.uid);
          }

          if(processtype ==  ProcessType.signup){
            signUpProcess(authcredential.user!.uid);
          }
      }

    } on FirebaseAuthException catch (e) {
        isVerifyingPhoneNumber(false);
      App.showError(description: e.message);
    } on SocketException catch (e) {
       isVerifyingPhoneNumber(false);
       App.showError(description: e.message);
    }
  }

  void signUpProcess(String useruid) async  {
     var newuser = model.User( firstname: firstname, lastname: lastname,birthdate: birthday, region: region?.name, province: province?.name,  city: city?.name, barangay: barangay?.name, phonenumber: phonenumber, uid: useruid );
        var hasRecord = await checkUserRecord(useruid);
        if(!hasRecord){
          addUserInformationAndGoToMainScreen(newuser.toJson(), useruid); 
        }else{
          
          goToMainScreen();
        }
  }

  void logInProcess(String useruid)  async{
      var hasRecord = await checkUserAndGetRecord(useruid);
      if(hasRecord){
        goToMainScreen();
      }else{

          App.showError(description: 'Number is verfied but not registered. Signup first ');
          isVerifyingPhoneNumber(false);
          await auth.signOut();
          Get.offAll(()=> const StartScreen());
      }
  }

  void goToMainScreen() async {
    isVerifyingPhoneNumber(false);
    Get.offAll(()=>const AppMainScreen());
  }

 void listenToUserAccount() async {

      if(useraccount.value.uid == null){
       

          usercollection.doc(auth.currentUser!.uid).snapshots().listen((snapshot) { 
          if(snapshot.exists){
            useraccount(model.User.fromJason(snapshot.data() as Map<String, dynamic>));
          }
        });
       

      }
  }

  void logout() async {

    await auth.signOut();
    useraccount(model.User());
    Get.offAll(()=> const StartScreen());
    
  }
  void addUserInformationAndGoToMainScreen(Map<String, dynamic> userinformation, String useruid) async {
   
     await usercollection.doc(useruid).set(userinformation).then((_) {
          useraccount(model.User.fromJason(userinformation));
          goToMainScreen();
       }).catchError((e){
          isVerifyingPhoneNumber(false);
          App.showError(description: e.message);
       });
  }

  
  Future<bool> checkUserAndGetRecord(String useruid) async{

      var response = await usercollection.doc(useruid).get().catchError((e){ App.showError(description: e.message);});
      if(response.exists){
        useraccount(model.User.fromJason(response.data() as Map<String, dynamic>));
        return true;
      }else{
        return false;
      }

    
  }
  Future<bool> checkUserRecord(String useruid) async{

      var response = await usercollection.doc(useruid).get().catchError((e){ App.showError(description: e.message);});
      if(response.exists){
        var data =  response.data() as Map<String, dynamic>;
        print(data);
        return true;
      }else{
        return false;
      }

    
  }

  void getRegions() async {
    if (regions.length == 0) {
      var response = await Api()
          .get('https://ph-locations-api.buonzz.com/v1/regions')
          .catchError(errorHandler);
      if (response != null) {
        for (var e in response['data']) {
          regions.add((Region.fromJson(e)));
        }
        region = regions.first;
        update();
      }
    }

    /// initilize defaul data
    /// setNewRegion(region!.name.toString());
  }

  void setNewRegion(
    String regionname,
  ) {
    var index = regions.indexWhere((element) => element.name == regionname);
    region = regions[index];
    update();
    clearProvinces();
    getProvince(region!.id.toString());
  }

  void getProvince(
    String regioncode,
  ) async {
    var response = await Api().get(
        'https://ph-locations-api.buonzz.com/v1/provinces?filter[where][region_code]=${regioncode}${Api.orderascending}');
    if (response != null) {
      for (var e in response['data']) {
        provinces.add((Province.fromJson(e)));
      }
    }
    province = provinces.first;
    update();
    setNewProvince(province!.name.toString());
  }

  void setNewProvince(String provincename) {
    var index = provinces.indexWhere((p) => p.name == provincename);
    province = provinces[index];
    update();
    clearCities();
    getCities(province!.regionCode, province!.id);
  }

  void getCities(String regioncode, String provincecode) async {
    var response = await Api().get(
        'https://ph-locations-api.buonzz.com/v1/cities?filter[where][region_code]=${regioncode}&filter[where][province_code]=${provincecode}${Api.orderascending}');
    if (response != null) {
      for (var e in response['data']) {
        cities.add((City.fromJson(e)));
      }
    }
    city = cities.first;
    update();
    setNewCity(city!.name.toString());
  }

  void setNewCity(String cityname) {
    var index = cities.indexWhere((element) => element.name == cityname);
    city = cities[index];
    update();
    if (barangays.length > 0) {
      barangays.clear();
    }
    getBarrangays(city!.id.toString(), city!.regionCode.toString(),
        city!.provinceCode.toString());
  }

  void clearBarangays() {
    if (barangays.length > 0) {
      barangays.clear();
    }
  }

  void getBarrangays(
      String citycode, String regioncode, String provincecode) async {
    var response = await Api().get(
        'https://ph-locations-api.buonzz.com/v1/barangays?filter[where][region_code]=${regioncode}&filter[where][city_code]=${citycode}&filter[where][province_code]=${provincecode}${Api.orderascending}');
    if (response != null) {
      for (var e in response['data']) {
        barangays.add((Barangay.fromJson(e)));
      }
    }
    barangay = barangays.first;
    update();
  }

  void setNewBaranggay(String barangayname) {
    var index = barangays.indexWhere((element) => element.name == barangayname);
    barangay = barangays[index];
    update();
    print(barangay!.name);
  }

  void clearCities() {
    if (cities.length > 0) {
      cities.clear();
    }
  }

  void clearProvinces() {
    if (provinces.length > 0) {
      provinces.clear();
    }
  }



}
