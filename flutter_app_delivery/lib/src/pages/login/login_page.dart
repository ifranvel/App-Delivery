import 'package:flutter/material.dart';
import 'package:flutter_app_delivery/src/pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  LoginController con = Get.put(LoginController());

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
            _boxForm(context),
            Column(
              children: [
                _imageCover(context),
                _textAppName(),
              ],
            ),
          ]),
        ));
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.37,
      color: Colors.amber,
    );
  }

  Widget _textAppName() {
    return const Text(
      "DELIVERY",
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
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
          onTap: () => con.goToRegisterPage(),
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

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Contraseña", prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  Widget _imageCover(BuildContext context) {
    return SafeArea(
      child: Container(
        margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
        alignment: Alignment.center,
        child: Image.asset('assets/img/delivery.png', width: 130, height: 130),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
            onPressed: () => con.login(),
            child: const Text(
              "INGRESAR",
              style: TextStyle(color: Colors.black),
            )));
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.30, left: 50, right: 50),
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 26)]),
      child: Column(
        children: [
          _textYourInfo(),
          _textFieldEmail(),
          _textFieldPassword(),
          _loginButton()
        ],
      ),
    );
  }
}
