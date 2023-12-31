import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/providers/users_provider.dart';
import 'package:flutter_app_delivery/src/models/user.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController{
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
  
  ImagePicker picker = ImagePicker();
  File? imageFile;

  void register() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = nameController.text.trim();
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String confirmpassword = confirmpasswordController.text.trim();

    if(_ValidationRegister(email, password, name, lastname, phone, confirmpassword)){

      User user = User(email: email, password: password, name: name, lastname: lastname, phone: phone);

      Response response = await usersProvider.create(user);

      Get.snackbar("Formulario válido", "Estás listo para enviar la petición Http");
    }
  }

  bool _ValidationRegister(String email, String password, String name, String lastname, String phone, String confirmpassword){

    bool okValidation = true;

    if(email.isEmpty){
      Get.snackbar("Formulario no válido", "Debes ingresar el email.");
      okValidation = false;
    }

    if(password.isEmpty){
      Get.snackbar("Formulario no válido", "Debes ingresar la contraseña.");
      okValidation = false;
    }

    if(confirmpassword.isEmpty){
      Get.snackbar("Formulario no válido", "Debes ingresar la confirmación de la contraseña.");
      okValidation = false;
    }
    
    if(name.isEmpty){
      Get.snackbar("Formulario no válido", "Debes ingresar el nombre.");
      okValidation = false;
    }

    if(lastname.isEmpty){
      Get.snackbar("Formulario no válido", "Debes ingresar el apellido.");
      okValidation = false;
    }

    if(phone.isEmpty){
      Get.snackbar("Formulario no válido", "Debes ingresar el teléfono.");
      okValidation = false;
    }

    if(password!=confirmpassword){
      Get.snackbar("Formulario no válido", "Las contraseñas introducidas no coinciden.");
      okValidation = false;
    }

    return okValidation;
  }


  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);

    if(image != null){
      imageFile = File(image.path);
      update();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton =
        ElevatedButton(onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery);

        }, child: const Text("GALERÍA", style: TextStyle(color: Colors.black)));

    Widget cameraButton =
        ElevatedButton(onPressed: () {
          Get.back();
          selectImage(ImageSource.camera);
          
        }, child: const Text("CÁMARA", style: TextStyle(color: Colors.black)));

    AlertDialog alertDialog = AlertDialog(
      title: const Text("Selecciona una opción"),
      actions: [galleryButton, cameraButton],
    );

    showDialog(context: context, builder: (BuildContext context) {
      return alertDialog;
    });
  }
}