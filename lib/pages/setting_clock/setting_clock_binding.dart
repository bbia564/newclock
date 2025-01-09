import 'package:get/get.dart';

import 'setting_clock_logic.dart';

class SettingClockBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
