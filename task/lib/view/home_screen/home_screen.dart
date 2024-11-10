import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/home_controller.dart';

import '../widget/show_apidata_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B37EA),
        centerTitle: true,
        title: const Text(
          "SMT Task",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                customButton(
                  title: "Show ApiData",
                  index: 0,
                  onTap: () {
                    homeController.isButtonIndex.value = 0;
                  },
                ),
                
                customButton(
                  title: "Show Weather",
                  index: 1,
                  onTap: () {
                    homeController.isButtonIndex.value = 1;
                  },
                ),
              ],
            ),
            //================================================button body here
            Obx((){
              return homeController.isButtonIndex.value == 0?showApidataScreen():SizedBox();
            })
          ],
        ),
      ),
    );
  }

  //=========================================================custom button
  customButton({String? title, int? index, VoidCallback? onTap}) {
    return Obx(() {
      return InkWell(
          onTap: onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 700),
            height: 50,
            width: 150,
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
                border: (homeController.isButtonIndex.value == index)
                    ? Border.all(color: Colors.transparent)
                    : Border.all(color: const Color(0xFF0B37EA)),
                color: homeController.isButtonIndex.value == index
                    ? const Color(0xFF0B37EA)
                    : Colors.white),
            child: Center(
              child: Text(
                title!,
                style: TextStyle(
                    fontSize: 18,
                    color: homeController.isButtonIndex.value == index
                        ? Colors.white
                        : const Color(0xFF0B37EA)),
              ),
            ),
          ));
    });
  }
  //================================================show api data body
 Widget showApidataScreen(){
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
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
            }));
  }
}
