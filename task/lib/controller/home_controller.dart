

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task/model/home_model.dart';
import 'package:task/service/api_service.dart';

class HomeController extends GetxController {
  RxList<DataModel> dataList = <DataModel>[].obs;
  RxInt isButtonIndex = 0.obs;

  Future<void> getData() async {
    var response = await http.get(Uri.parse(ApiService.homeApi));

    try {
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        List<DataModel> fetchedData = [];
        for (Map<String, dynamic> item in decodeData) {
          fetchedData.add(DataModel.fromJson(item));
        }
        dataList.value = fetchedData; 
        print("================================== $dataList");
      } else {
        debugPrint("Status code is ====${response.statusCode.toString()}");
      }
    } catch (e) {
      debugPrint("catch error: ${e.toString()}");
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getData();
  }
}
