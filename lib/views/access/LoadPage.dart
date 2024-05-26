import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../MainPages/MainMenu.dart';
import 'Login.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {

  Future<bool> isActiveSession() async{
    bool response = false;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString('user')??'';
    String password = prefs.getString('password')??'';

    await Future.delayed(const Duration(seconds: 3), () {
    });

    //logica de comunicación con el servidor para consulta de datos del usuario

    if(user.isNotEmpty&&password.isNotEmpty){
      response = true;
    }
    return response;
  }


  Future<void> temporal() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString('user')??'';
    String password = prefs.getString('password')??'';

    await Future.delayed(const Duration(seconds: 3), () {
    });

    //logica de comunicación con el servidor para consulta de datos del usuario

    if(user.isNotEmpty&&password.isNotEmpty){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MainMenu())
      );
    }
    else{
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Login())
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temporal();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset("assets/images/logo.png",width: 150,),
        const SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

/*
* FutureBuilder<bool>(
      future: isActiveSession(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Column(
              children: [
                const Spacer(),
                Image.asset("assets/images/logo.png",width: 150,),
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
              ],
            );
          default:
            if (snapshot.hasError){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login())
                );
              return Scaffold();
            }
            else{
              if(snapshot.data!){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainMenu())
                );
              }else{
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login())
                );
              }
              return Scaffold();
            }
        }
      }
    )
* */