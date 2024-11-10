import 'package:get/get.dart';
import 'package:task/view/home_screen/home_screen.dart';

class AppRoute {
  static const homeScreen = '/homeScreen';
  static List<GetPage> pages = [
    GetPage(name: homeScreen, page: ()=> HomeScreen() )
  ];

}