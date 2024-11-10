import 'package:flutter/material.dart';
import 'package:task/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:task/view/widget/show_apidata_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Obx(() {
              return ListView.builder(
                  itemCount: homeController.dataList.length,
                  itemBuilder: (context, index) {
                    final data = homeController.dataList[index];
                    return homeController.dataList.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          )
                        : ShowApidataCard(
                            cardNumer: data.id.toString(),
                            userId: data.userId.toString(),
                            title: data.title!);
                  });
            })));
  }
}
