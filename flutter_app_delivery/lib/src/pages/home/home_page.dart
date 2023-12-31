import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeController con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () => con.signOut(), child: const Text("Cerrar sesión")),
      ),
    );
    
  }
}