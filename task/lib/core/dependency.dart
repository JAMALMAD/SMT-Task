import 'package:get/get.dart';
import 'package:task/controller/api_controller.dart';
import 'package:task/controller/weather_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>WeatherController());
  }
}