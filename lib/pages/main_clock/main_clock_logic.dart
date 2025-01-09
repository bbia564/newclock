import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:more_clock/main.dart';
import 'package:more_clock/pages/main_clock/main_clock_view.dart';
import 'package:styled_widget/styled_widget.dart';

class MainClockLogic extends GetxController {
  int clockType = 0;
  int colorType = 0;
  var yearStr = ''.obs;
  var monthDayStr = ''.obs;
  var hourMinuteStr = ''.obs;

  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      var now = DateTime.now();
      yearStr.value = now.year.toString();
      monthDayStr.value =
          '${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}';
      hourMinuteStr.value =
          '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    });
  }

  void showSetting() {
    Get.bottomSheet(Container(
      width: double.infinity,
      height: 350,
      child: SafeArea(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: <Widget>[
          const Text('Select dial'),
          const SizedBox(
            height: 15,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemCount: gradientList.length,
              itemBuilder: (_, index) {
                return Image.asset('assets/bg$index.webp').gestures(onTap: () {
                  clockType = index;
                  update();
                  Get.back();
                });
              }),
          Divider(
            height: 30,
            color: Colors.grey[300],
          ),
          const Text('Select background color'),
          const SizedBox(
            height: 15,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemCount: gradientList.length,
              itemBuilder: (_, index) {
                return Container()
                    .decorated(
                  borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(colors: [
                  gradientList[index],
                  const Color(0xfff7f7f7)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter))
                    .gestures(onTap: () {
                  colorType = index;
                  update();
                  Get.back();
                });
              })
        ].toColumn(),
      ).marginAll(15)),
    ).decorated(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))));
  }

  @override
  void onInit() {
    // TODO: implement onInit\
    startTimer();
    super.onInit();
  }
}
