import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'setting_clock_logic.dart';

class SettingClockView extends GetView<PageLogic> {
  const SettingClockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.hagenes.value
              ? const CircularProgressIndicator(color: Colors.orangeAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.aftkruih();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
