import 'dart:core';

class Privacidad {
  bool visibilidadPerfil;
  bool compartirDatos;
  bool personalizacionAnuncios;

  Privacidad({
    this.visibilidadPerfil = true,
    this.compartirDatos = false,
    this.personalizacionAnuncios = false,
  });

  Privacidad.fromJson(Map<String, dynamic> json)
      : visibilidadPerfil = json['visibilidadPerfil'],
        compartirDatos = json['compartirDatos'],
        personalizacionAnuncios = json['personalizacionAnuncios'];

  Map<String, dynamic> toJson() => {
    'visibilidadPerfil': visibilidadPerfil,
    'compartirDatos': compartirDatos,
    'personalizacionAnuncios': personalizacionAnuncios,
  };

  void toggleVisibilidadPerfil() {
    visibilidadPerfil = !visibilidadPerfil;
  }

  void toggleCompartirDatos() {
    compartirDatos = !compartirDatos;
  }

  void togglePersonalizacionAnuncios() {
    personalizacionAnuncios = !personalizacionAnuncios;
  }
}
