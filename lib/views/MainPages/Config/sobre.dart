import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/configModels/sobreModel.dart';

class AboutScreen extends StatelessWidget {
  final Sobre aboutInfo = Sobre(
    nombreApp: 'LoveLink',
    versionApp: '1.0.0',
    descripcionApp: 'App para buscar tu amor!',
    desarolladoresApp: 'LoveLink Team',
    contactarDesarolladores: 'info@lovelink.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundNav,
      appBar: AppBar(
        title: const Text('Sobre'),
        backgroundColor: const Color(0xffffa31a),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre de la App: ${aboutInfo.nombreApp}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Versión de la App: ${aboutInfo.versionApp}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Descripción: ${aboutInfo.descripcionApp}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Desarrolladores: ${aboutInfo.desarolladoresApp}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Contacto: ${aboutInfo.contactarDesarolladores}',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
