import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/pages/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  RegisterController con = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 70,
          child: _textDontHaveAccount(),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            _backgroundCover(context),
            _goBackButton(),
            _userAvatar(),
            _boxForm(context),
          ]),
        ));
  }

  
  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.33,
      color: Colors.amber,
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "¿No tienes una cuenta? ",
          style: TextStyle(fontSize: 17, color: Colors.black),
        ),
        GestureDetector(
          child: const Text(
            "Regístrate.",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
        )
      ],
    );
  }

  Widget _textYourInfo() {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 40),
        child: const Text("INGRESE ESTA INFORMACIÓN"));
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: "Correo electrónico", prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
            hintText: "Nombre", prefixIcon: Icon(Icons.person)),
      ),
    );
  }
  Widget _textFieldLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: con.lastnameController,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
            hintText: "Apellido", prefixIcon: Icon(Icons.person_outline)),
      ),
    );
  }
  Widget _textFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
            hintText: "Teléfono", prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: "Contraseña", prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: con.confirmpasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: "Confirmar contraseña", prefixIcon: Icon(Icons.lock_outline)),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
            onPressed: () => con.register(),
            child: const Text(
              "REGISTRARSE",
              style: TextStyle(color: Colors.black),
            )));
  }

  Widget _goBackButton() {
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.all(5),
          child: IconButton(
            iconSize: 30,
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => Get.back(),
          )),
    );
  }

  Widget _userAvatar(){
    return  SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 23),
        alignment: Alignment.topCenter,
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60,
          backgroundImage: AssetImage("assets/img/person_icon.png"),
        ),
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.25, left: 50, right: 50),
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 26)]),
      child: Column(
        children: [
          _textYourInfo(),
          _textFieldEmail(),
          _textFieldName(),
          _textFieldLastName(),
          _textFieldPhone(),
          _textFieldPassword(),
          _textFieldConfirmPassword(),
          _registerButton()
        ],
      ),
    );
  }
}