
// import 'dart:convert';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:http/http.dart' as http;
// import 'package:task/model/api_data_model.dart';
// import 'package:task/service/api_service.dart';

// class HomeController extends GetxController {
//   RxList<DataModel> dataList = <DataModel>[].obs;
//   RxInt isButtonIndex = 0.obs;
//   Box<DataModel>? localBox;
//   var isLoading = true.obs;

//     Future<void> loadData() async {
//     if (localBox!.isNotEmpty) {
//       dataList.value = localBox!.values.toList();
//       isLoading.value = false;
//       return;
//     }
//     var connectivityResult = await Connectivity().checkConnectivity();
//     print(
//         '===============================Connectivity result: $connectivityResult');

//     if (connectivityResult == ConnectivityResult.none) {
//       isLoading.value = false;
//       print("No internet connection and no local data found");
//     } else {
//       await getData();
//     }
//   }
//   Future<void> getData() async {
//     var response = await http.get(Uri.parse(ApiService.taskOneApi));

//     try {
//       if (response.statusCode == 200) {
//         var decodeData = jsonDecode(response.body);
//         List<DataModel> fetchedData = [];
//         dataList.value = decodeData.map((json) => DataModel.fromJson(json)).toList();
//         //==========================================save data to local database 
//         await localBox!.clear();
//         await localBox!.addAll(dataList);
//         debugPrint("=================datalist================= $fetchedData");
//       } else {
//         debugPrint("Status code is ====${response.statusCode.toString()}");
//       }
//     } catch (e) {
//       debugPrint("catch error: ${e.toString()}");
//     }
//   }

//   @override
//   void onInit() async {
//     super.onInit();
    
//     localBox = Hive.box<DataModel>('dataList');
//     await loadData;
//     await getData();
//   }
// }

import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:task/model/api_data_model.dart';
import 'package:task/service/api_service.dart';

class HomeController extends GetxController {
  RxList<DataModel> dataList = <DataModel>[].obs;
  RxInt isButtonIndex = 0.obs;
  Box<DataModel>? localBox;
  var isLoading = true.obs;

  Future<void> loadData() async {
    if (localBox!.isNotEmpty) {
      dataList.value = localBox!.values.toList();
      isLoading.value = false;
      return;
    }
    var connectivityResult = await Connectivity().checkConnectivity();
    print('===============================Connectivity result: $connectivityResult');

    if (connectivityResult == ConnectivityResult.none) {
      isLoading.value = false;
      print("No internet connection and no local data found");
    } else {
      await getData();
    }
  }

  Future<void> getData() async {
    var response = await http.get(Uri.parse(ApiService.taskOneApi));

    try {
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body) as List;
        List<DataModel> fetchedData = decodeData.map((json) => DataModel.fromJson(json)).toList();
        
        dataList.value = fetchedData; // Update dataList with fetchedData
        await localBox!.clear();
        await localBox!.addAll(fetchedData); // Save fetchedData in localBox
        debugPrint("=================datalist================= $fetchedData");
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
    localBox = await Hive.openBox<DataModel>('dataList'); // Ensure localBox is opened properly
    await loadData(); // Correctly await loadData function call
  }
}
