import 'package:get/get.dart';

import 'main_clock_logic.dart';

class MainClockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainClockLogic());
  }
}
