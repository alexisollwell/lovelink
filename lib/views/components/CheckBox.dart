import 'package:flutter/material.dart';

class CheckBoxLove extends StatefulWidget {
  const CheckBoxLove({Key? key}) : super(key: key);

  @override
  _CheckBoxLoveState createState() => _CheckBoxLoveState();
}

class _CheckBoxLoveState extends State<CheckBoxLove> {
  bool isChecked = false; // Estado del checkbox

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        // Actualizamos el estado cuando se toca el checkbox
        setState(() {
          isChecked = value ?? false;
        });

        // Imprimimos un mensaje en la consola según el estado del checkbox
        if (isChecked) {
          print('Checked');
        } else {
          print('Unchecked');
        }
      },
      activeColor: Colors.black, // Color al ser seleccionado
    );
  }
}