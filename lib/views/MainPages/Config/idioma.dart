import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/configModels/idiomaModel.dart';

class IdiomaScreen extends StatefulWidget {
  const IdiomaScreen({Key? key}) : super(key: key);

  @override
  _IdiomaScreenState createState() => _IdiomaScreenState();
}

class _IdiomaScreenState extends State<IdiomaScreen> {
  Idioma _idioma = Idioma();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundNav,
      appBar: AppBar(
        title: const Text('Idioma'),
        backgroundColor: const Color(0xffffa31a),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'Selecciona tu idioma',
            style: const TextStyle(color: Colors.white),
      ),

            DropdownButton<String>(
              value: _idioma.idiomaActual,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: TextStyle(color: Colors.white),
              dropdownColor: backgroundNav,
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _idioma.cambiarIdioma(newValue!);
                });
              },
              items: _idioma.listaIdiomas.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
