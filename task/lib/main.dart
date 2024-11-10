import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task/core/dependency.dart';
import 'package:task/core/route.dart';
import 'package:task/model/api_data_model.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>('dataList');
  DependencyInjection di = DependencyInjection();
  di.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppRoute.pages,
      initialRoute: AppRoute.homeScreen,
    );
  }
}
