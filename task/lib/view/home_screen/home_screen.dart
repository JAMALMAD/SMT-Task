import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/api_controller.dart';
import 'package:task/controller/weather_controller.dart';

import '../../model/weather_data_model.dart';
import '../widget/show_apidata_card.dart';
import '../widget/todays_weather.dart';
import '../widget/weather_hours.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.find<HomeController>();
  final WeatherController weatherController = Get.find<WeatherController>();
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
            const SizedBox(
              height: 20,
            ),
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
            Obx(() {
              return homeController.isButtonIndex.value == 0
                  ? showApidataScreen()
                  : weatherDataBody();
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
            duration: const Duration(milliseconds: 700),
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

  //================================================show josonplace holder api  data body
  Widget showApidataScreen() {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
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

  //==================================================================weather data body
  Widget weatherDataBody() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      height: Get.height,
      width: Get.width,
      child: FutureBuilder(
          future: weatherController.getWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return SizedBox(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * .04, vertical: Get.height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TodaysWeather(weathermodel: weatherModel),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Weather By Hours",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF3467F3),
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 150,
                        child: HoursWeather(weatherModel: weatherModel),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              ));
            }
          }),
    );
  }
}
