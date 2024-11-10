// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/weather_data_model.dart';

// ignore: must_be_immutable
class TodaysWeather extends StatelessWidget {
  WeatherModel? weathermodel;
  TodaysWeather({super.key, required this.weathermodel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF3467F3),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFF667EF6),
                          blurRadius: 0.8,
                          spreadRadius: 0.5,
                          offset: Offset(0, 1))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text(
                        weathermodel?.location?.name ?? "",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(DateTime.parse(
                            weathermodel?.current?.lastUpdated ?? "")),
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 15),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                          child: Image.network(
                              "http:${weathermodel?.current?.condition?.icon ?? ""}")),
                      const Spacer(),
                      Text(
                        weathermodel?.current?.tempC?.round().toString() ?? "",
                        style: const TextStyle(
                            fontSize: 60,
                            color: Colors.pink,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 5),
                      ),
                      const Text(
                        "o",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.pink,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    weathermodel?.current?.condition?.text.toString() ?? "",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF3467F3),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              //there is feelings====================
              Container(
                margin: const EdgeInsets.only(top: 8),
                
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF3467F3),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Feel Like",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            weathermodel?.current?.feelslikeC
                                    ?.round()
                                    .toString() ??
                                "",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Wind",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${weathermodel?.current?.windKph?.round().toString()} Km/h",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Humidity",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${weathermodel?.current?.humidity.toString()}%",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Visibility",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${weathermodel?.current?.visKm?.round().toString()} Km",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
              )
            ],
          ),
        )
      ],
    );
  }
}
