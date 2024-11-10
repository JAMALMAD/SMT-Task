import 'package:get/get.dart';
import 'package:task/controller/home_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController());
  }
}