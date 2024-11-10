import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/weather_data_model.dart';

// ignore: must_be_immutable
class HoursWeather extends StatelessWidget {
  WeatherModel? weatherModel;
  HoursWeather({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: weatherModel?.forecast?.forecastday?[0].hour?.length,
        itemBuilder: (context, index) {
          Hour? hour = weatherModel?.forecast?.forecastday?[0].hour?[index];
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            padding:  const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            width: 120,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color:Color.fromARGB(123, 157, 179, 238),
                  blurRadius: 0.2,
                  spreadRadius: 3,
                  offset: Offset(1, 1)
                )
              ],
              borderRadius: BorderRadius.circular(20),
              color:
                   const Color(0xFF3467F3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(hour?.tempC?.round().toString()??"",style: const TextStyle(color: Colors.white,)),
                    ),
                    const Text("o",style: TextStyle(color: Colors.white,fontSize: 10),)
                  ],
                ),
                
                Image.network("http:${hour?.condition?.icon}"),
                
                Text(DateFormat.j().format(DateTime.parse(hour?.time??'')),style: const TextStyle(color: Colors.white),),
              ],
            ),
          );
        });
  }
}
