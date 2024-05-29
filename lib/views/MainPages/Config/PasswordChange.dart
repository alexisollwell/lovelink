import 'package:flutter/material.dart';
import 'package:lovelink/views/components/LoveButton.dart';
import '../../access/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/LoveTextField.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({super.key});

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  Future<void> ChangePass() async {

    if(oldPassword.text.isEmpty){
      print("No se declaro la contraseña actual");
      return;
    }
    if(newPassword.text.isEmpty){
      print("No hay nueva contra");
      return;
    }
    if(confirmPassword.text.isEmpty){
      print("Se falta la confirmación");
      return;
    }
    if(newPassword.text != confirmPassword.text){
      print("En veces la vida no es como uno quiere");
      return;
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Estas a punto de cambiar tu contraseña."),
            actions: [
              TextButton(
                  onPressed: () async {
                    final SharedPreferences prefs = await SharedPreferences
                        .getInstance();
                    await prefs.remove('user');
                    await prefs.remove('password');

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login())
                    );
                  },
                  child: const Text("Continuar")
              ),
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar")
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
               LoveTextField(
                  Placeholder: "Contraseña antigua",
                  Wsize: double.infinity,
                  textColor: Colors.black,
                  isObscured: true,
                  controller: oldPassword,
              ),
              const SizedBox(height: 50,),
               LoveTextField(
                  Placeholder: "Nueva contraseña",
                  Wsize: double.infinity,
                  textColor: Colors.black,
                  isObscured: true,
                  controller: newPassword,
              ),
              const SizedBox(height: 50,),
               LoveTextField(
                  Placeholder: "Confirmar contraseña",
                  Wsize: double.infinity,
                  textColor: Colors.black,
                  isObscured: true,
                  controller: confirmPassword,
              ),
              const SizedBox(height: 100,),
              InkWell(
                onTap: ChangePass,
                  child:
                  LoveButton(
                      texto: "Cambiar Contraseña", Wsize: MediaQuery.of(context).size.width/2)
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}