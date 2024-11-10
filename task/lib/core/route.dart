import 'package:get/get.dart';
import 'package:task/view/task_one_screen/show_apidata_screen.dart';

class AppRoute {
  static const homePage = '/homePage';
  static List<GetPage> pages = [
    GetPage(name: homePage, page: ()=> HomeScreen() )
  ];

}