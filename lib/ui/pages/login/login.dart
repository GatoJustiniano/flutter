// ignore_for_file: deprecated_member_use
import 'package:sys4signal/src/login/infrastructure/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrouter/vrouter.dart';
import '../../../src/login/domain/character.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_login_ui/utilities/constants.dart';

void main() {
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  late EasyLoadingStyle loadingStyle;
  String descripcionv = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UsuarioController userController = UsuarioController();

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      String descripcion = value.getString('descripcion') ?? "";

      setState(() {
        descripcionv = descripcion;
      });
    });

    super.initState();
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: nameController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Color(0xff009688),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 18.0),
              prefixIcon: const Icon(
                Icons.person,
                color: Color(0xff009688),
              ),
              hintText: 'Usuario',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: passwordController,
            obscureText: _isObscure,
            style: const TextStyle(
              color: Color(0xff009688),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Contraseña',
              hintStyle: kHintTextStyle,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 1.5),
              prefixIcon: const Icon(
                Icons.lock,
                color: Color(0xff009688),
              ),
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                    _isObscure == true ? Icons.remove_red_eye : Icons.password),
                color: const Color(0xff009688),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5, // Elevación
        ),
        onPressed: () async {
          EasyLoading.instance.indicatorType =
              EasyLoadingIndicatorType.chasingDots;
          EasyLoading.instance.radius = 10;
          EasyLoading.instance.loadingStyle = EasyLoadingStyle.dark;
          EasyLoading.show(
            status: 'cargando...',
            maskType: EasyLoadingMaskType.black,
          );

          String us = nameController.text;
          String pa = passwordController.text;

          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('islogged', true);

          context.vRouter.to('/cliente');
          EasyLoading.dismiss();
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: const Text(
          'INGRESAR',
          style: TextStyle(
            color: Color.fromARGB(255, 54, 59, 65),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff03a9f4), Color(0xff009688)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'FISIO-APP',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        _buildEmailTF(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        _buildLoginBtn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final kHintTextStyle = const TextStyle(
    color: Color(0xff009688),
    fontFamily: 'OpenSans',
  );

  final kLabelStyle = const TextStyle(
    color: Color(0xff009688),
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  final kBoxDecorationStyle = BoxDecoration(
    color: Colors.white70,
    borderRadius: BorderRadius.circular(40.0),
    // ignore: prefer_const_literals_to_create_immutables
    boxShadow: [
      const BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}
