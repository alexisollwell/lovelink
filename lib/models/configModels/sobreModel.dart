import 'dart:core';

class Sobre {
  String nombreApp;
  String versionApp;
  String descripcionApp;
  String desarolladoresApp;
  String contactarDesarolladores;

  Sobre({
    required this.nombreApp,
    required this.versionApp,
    required this.descripcionApp,
    required this.desarolladoresApp,
    required this.contactarDesarolladores,
  });

  Sobre.fromJson(Map<String, dynamic> json)
      : nombreApp = json['nombreApp'],
        versionApp = json['versionApp'],
        descripcionApp = json['descripcionApp'],
        desarolladoresApp = json['desarolladoresApp'],
        contactarDesarolladores = json['contactarDesarolladores'];

  Map<String, dynamic> toJson() => {
    'nombreApp': nombreApp,
    'versionApp': versionApp,
    'descripcionApp': descripcionApp,
    'desarolladoresApp': desarolladoresApp,
    'contactarDesarolladores': contactarDesarolladores,
  };
}
