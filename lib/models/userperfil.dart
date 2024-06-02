import 'intereses.dart';
import 'preferencias.dart';

class userperfil {
  String nombre;
  int edad;
  String ubicacion;
  List<interesesModel> intereses;
  List<preferenciasModel> preferencias;

  userperfil({
    required this.nombre,
    required this.edad,
    required this.ubicacion,
    required this.intereses,
    required this.preferencias,
});
  factory userperfil.fromJson(Map<String, dynamic> json) => userperfil(
    nombre: json['nombre'],
    edad: json['edad'],
    ubicacion: json['ubicacion'],
    intereses: List<interesesModel>.from(json['interesesModel'].map((x)=> interesesModel.fromJson(x))),
    preferencias: List<preferenciasModel>.from(json['preferenciasModel'].map((x)=> preferenciasModel.fromJson(x))),
  );
  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'edad': edad,
    'ubicacion': ubicacion,
  };
}