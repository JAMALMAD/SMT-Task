import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/dependency.dart';
import 'package:task/core/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection di = DependencyInjection();
  di.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppRoute.pages,
      initialRoute: AppRoute.homePage,
    );
  }
}
