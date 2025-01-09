import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:get/get.dart';
import 'package:more_clock/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'main_clock_logic.dart';

class MainClockPage extends GetView<MainClockLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: null,
        actions: [
          const Icon(
            Icons.settings,
            size: 25,
            color: Colors.grey,
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.showSetting();
          })
        ],
      ),
      body: GetBuilder<MainClockLogic>(builder: (_) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  Obx(() {
                    return Text(
                      controller.yearStr.value,
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    );
                  }),
                  Obx(() {
                    return Text(
                      controller.monthDayStr.value,
                      style: const TextStyle(fontSize: 31),
                    );
                  }),
                  const SizedBox(height: 30,),
                  Container(
                    width: 310,
                    height: 310,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/bg${controller.clockType}.webp')),
                    ),
                    child: const AnalogClock(
                      dialColor: null,
                      markingColor: null,
                      hourNumberColor: null,
                      secondHandColor: null,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Obx(() {
                    return Text(
                      controller.hourMinuteStr.value,
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    );
                  }),
                  const SizedBox(height: 30,),
                  const Text('v1.0.0',style: TextStyle(color: Colors.grey,fontSize: 12),)
                ].toColumn(),
              )),
        ).decorated(
            gradient: LinearGradient(colors: [
              gradientList[controller.colorType],
              const Color(0xfff7f7f7)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter));
      }),
    );
  }
}
