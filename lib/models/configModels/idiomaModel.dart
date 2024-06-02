import 'dart:core';

class Idioma {
  String idiomaActual;
  final List<String> listaIdiomas;

  Idioma({
    this.idiomaActual = 'Español',
    this.listaIdiomas = const ['Ingles', 'Español', 'Frances', 'Aleman'],
  });

  Idioma.fromJson(Map<String, dynamic> json)
      : idiomaActual = json['idiomaActual'],
        listaIdiomas = List<String>.from(json['listaIdiomas'].map((x) => Idioma.fromJson(x))
        );

  Map<String, dynamic> toJson() => {
    'idiomaActual': idiomaActual,
    'listaIdiomas': listaIdiomas,
  };

  void cambiarIdioma(String idiomaNuevo) {
    if (idiomaActual.contains(idiomaNuevo)) {
      idiomaActual = idiomaNuevo;
    }
  }
}
