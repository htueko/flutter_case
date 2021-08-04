import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/route/app_page.dart';
import 'common/route/app_route.dart';
import 'feature/get_countries/di/connectivity_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: ConnectivityBinding(),
      initialRoute: AppRoutes.countriesRoute,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
    );
  }
}
