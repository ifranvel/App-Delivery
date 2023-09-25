import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/models/response_api.dart';
import 'package:flutter_app_delivery/src/providers/users_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UsersProvider usersProvider = UsersProvider();

  void goToRegisterPage(){
    Get.toNamed("/register");
  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print(email);
    print(password);

    if(_ValidationLogin(email, password)){
      Get.snackbar("Formulario válido", "Estás listo para enviar la petición Http");
      ResponseApi responseApi = await usersProvider.login(email, password);

      if(responseApi.success == true){
        GetStorage().write("user", responseApi.data);
        goToHomePage();
        //Get.snackbar("Login exitoso", responseApi.message ?? "");
      }else{
        Get.snackbar("Login fallido", responseApi.message ?? "");
      }
      
    }
  }

  void goToHomePage(){
    //Get.toNamed("/home");
    Get.offNamedUntil("/home", (route) => false);
  }

  bool _ValidationLogin(String email, String password){
    bool okValidation = true;

    if(email.isEmpty){
      Get.snackbar("Formulario no válido", "El email no es válido.");
      okValidation = false;
    }

    if(password.isEmpty){
      Get.snackbar("Formulario no válido", "La contraseña no es válida.");
      okValidation = false;
    }

    return okValidation;
  }
}