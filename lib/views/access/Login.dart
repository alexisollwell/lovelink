import 'package:flutter/material.dart';
import 'package:lovelink/views/access/registro.dart';
import 'package:lovelink/views/components/LoveButton.dart';
import 'package:lovelink/views/components/LoveTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../MainPages/MainMenu.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> makeLogin() async{
    if(userController.text.isEmpty){
      print("Es necesario ingresar un correo");
      return;
    }
    if(passwordController.text.isEmpty){
      print("Es necesario ingresar tu contraseña");
      return;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', userController.text);
    await prefs.setString('password', passwordController.text);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MainMenu())
    );
  }

  void goToRegister(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const Registro())
    );
  }

  double getTextFieldsSize(){
    return MediaQuery.of(context).size.width*0.75;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Colors.white),
            Column(
              children: [
                const SizedBox(width: double.infinity,),
                const Spacer(),
                Image.asset("assets/images/logo.png",height: 150,),
                const Spacer(),
                LoveTextField(
                    Placeholder: "Correo",
                    Wsize: getTextFieldsSize(),
                    icono: Icon(Icons.email),
                    controller: userController,
                ),
                const SizedBox(height: 15,),
                LoveTextField(
                  Placeholder: "Contraseña",
                  Wsize: getTextFieldsSize(),
                  icono: Icon(Icons.lock),
                  controller: passwordController,
                  isObscured: true,
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end ,
                  children: [
                    const Text("Olvidaste tu contraseña?",style: TextStyle(fontSize: 15),),
                    SizedBox(width: MediaQuery.of(context).size.width*0.125,)
                  ],
                ),
                const Spacer(flex: 2,),
                GestureDetector(
                  onTap: makeLogin,
                  child: LoveButton(
                      texto: "Iniciar sesión",
                      Wsize: getTextFieldsSize()
                  ),
                ),
                const SizedBox(height: 15,),
                Text("Registrate",style: TextStyle(fontSize: 20),),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
