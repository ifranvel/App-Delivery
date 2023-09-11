import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/models/user.dart';
import 'package:flutter_app_delivery/src/pages/home/home_page.dart';
import 'package:flutter_app_delivery/src/pages/login/login_page.dart';
import 'package:flutter_app_delivery/src/pages/register/register_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

User userSession = User.fromJson(GetStorage().read("user") ?? {});

void main() async {
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Delivery",
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null ? "/home" : "/",
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/register", page: () => RegisterPage()),
        GetPage(name: "/home", page: () => HomePage())
        ],
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.amber,
              onPrimary: Colors.grey,
              secondary: Colors.amberAccent,
              onSecondary: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              background: Colors.grey,
              onBackground: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey)
              ),
      navigatorKey: Get.key,
    );
  }
}
