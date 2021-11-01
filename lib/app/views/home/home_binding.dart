import 'package:basesource/app/domains/setting/use_cases/setting_use_case.dart';
import 'package:basesource/app/views/home/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find<SettingUseCase>()));
  }
}
