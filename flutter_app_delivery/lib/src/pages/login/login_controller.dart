import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage(){
    Get.toNamed("/register");
  }

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print(email);
    print(password);

    if(_ValidationLogin(email, password)){
      Get.snackbar("Formulario válido", "Estás listo para enviar la petición Http");
    }
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