import 'package:basesource/app/data/provider/get_storage_provider.dart';
import 'package:basesource/app/data/repository_impl/setting_repo_impl.dart';
import 'package:basesource/app/domains/setting/use_cases/setting_use_case.dart';

import 'package:basesource/app/views/inital/initial_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Dependency {
  static init() async {
    //setting App depencency
    await GetStorage.init();
    Get.lazyPut(() => GetStorageProvider());
    Get.lazyPut<SettingRepositoryImpl>(
        () => SettingRepositoryImpl(Get.find<GetStorageProvider>()));
    Get.lazyPut<SettingUseCase>(
        () => SettingUseCase(Get.find<SettingRepositoryImpl>()));
    await Get.putAsync<InitialService>(
        () => InitialService(Get.find<SettingUseCase>()).init());
  }
}
