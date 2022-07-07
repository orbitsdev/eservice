import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:eservice/dialogs/app.dart';
import 'package:eservice/model/baranngay.dart';
import 'package:eservice/model/city.dart';
import 'package:eservice/model/province.dart';
import 'package:eservice/model/resgion.dart';
import 'package:eservice/services/api.dart';
import 'package:eservice/services/api_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Authcontroller extends GetxController with ApiHandler {
  var regions = <Region>[].obs;
  var provinces = <Province>[].obs;
  var cities = <City>[].obs;
  var barangays = <Barangay>[].obs;

  Region? region;
  Province? province;
  City? city;
  Barangay? barangay;

  @override
  void onInit() {
  getRegions();
    super.onInit();
  }

  var isLoading = false.obs;

  void getRegions() async { 
      
          
        
        var response = await Api().get('https://ph-locations-api.buonzz.com/v1/regions').catchError(errorHandler);
        if(response != null){
          for(var e in response['data']){regions.add((Region.fromJson(e)));} region =regions.first;
           update();
        }
       
       
        //setNewRegion(region!.name.toString());
  }

  void setNewRegion(String regionname,){
      var index =  regions.indexWhere((element) => element.name == regionname );
      region =  regions[index];
      update();
      clearProvinces();
      getProvince(region!.id.toString());
  }

  

  void getProvince(String regioncode,) async{
        var response = await Api().get('https://ph-locations-api.buonzz.com/v1/provinces?filter[where][region_code]=${regioncode}${Api.orderascending}');
        if(response != null){for(var e in response['data']){provinces.add((Province.fromJson(e)));}}
        //provinces.forEach((element) {print(element.name);});
        province =provinces.first;
        update();
        setNewProvince(province!.name.toString());
      
  }


  void setNewProvince(String provincename){

      var index = provinces.indexWhere((p) => p.name == provincename);
      province = provinces[index];
  
      update();
      clearCities();
      getCities(province!.regionCode, province!.id);

  }

 
  void getCities(String regioncode , String provincecode) async {
        var response = await Api().get('https://ph-locations-api.buonzz.com/v1/cities?filter[where][region_code]=${regioncode}&filter[where][province_code]=${provincecode}${Api.orderascending}');
        if(response != null){for(var e in response['data']){cities.add((City.fromJson(e)));}}
        //cities.forEach((element) {print(element.name);});
        city = cities.first;
        update();
        setNewCity(city!.name.toString());
  }


  void setNewCity(String cityname) {
      var index = cities.indexWhere((element) => element.name ==cityname);
      city = cities[index];
      update();
      if(barangays.length>0){
        barangays.clear();
      }
      getBarrangays(city!.id.toString(), city!.regionCode.toString(), city!.provinceCode.toString());
      
  }

  void clearBarangays() {
    if(barangays.length >0){
        barangays.clear();
    }
  }

  void getBarrangays(String citycode, String regioncode, String provincecode) async {
       var response = await Api().get('https://ph-locations-api.buonzz.com/v1/barangays?filter[where][region_code]=${regioncode}&filter[where][city_code]=${citycode}&filter[where][province_code]=${provincecode}${Api.orderascending}');
        if(response != null){for(var e in response['data']){barangays.add((Barangay.fromJson(e)));}}
        barangay = barangays.first;
        update();
  }
  void setNewBaranggay(String barangayname) {
        var index  = barangays.indexWhere((element) => element.name ==  barangayname);
        barangay = barangays[index];
        update();
        print(barangay!.name);
  }

 void clearCities() {
    if(cities.length>0){
      cities.clear();
    }
  }
void clearProvinces() {
    if(provinces.length >0 ){
      provinces.clear();
    }
  }



  void myfunction() {


  }
  

   
}
