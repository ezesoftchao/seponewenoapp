import 'package:get/get.dart';

import 'promotors_controller.dart';

class PromotorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromotorsController>(() => PromotorsController());
  }
}