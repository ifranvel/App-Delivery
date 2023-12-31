import 'package:flutter_app_delivery/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController{
  
  User user = User.fromJson(GetStorage().read("user") ?? {});

  HomeController(){
    printInfo(info: "${user.toJson()}");
  }

  void signOut(){
    GetStorage().remove("user");
    //Get.toNamed("/");
    Get.offNamedUntil("/", (route) => false); // Elimina historial pantallas
  }

}