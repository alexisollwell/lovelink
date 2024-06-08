import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/configModels/notificacionModel.dart';

class NotificationsScreen extends StatefulWidget {
  final Notificacion? initialNotificationSettings;

  const NotificationsScreen({Key? key, this.initialNotificationSettings}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late Notificacion notificationSettings;

  @override
  void initState() {
    super.initState();
    // Initialize the notification settings either from the widget or create a new instance
    notificationSettings = widget.initialNotificationSettings ?? Notificacion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundNav,
      appBar: AppBar(
        title: Text('Notificaciones'),
        backgroundColor: const Color(0xffffa31a)
      ),
      body: ListView(

        children: [
          buildSwitchListTile(
            title: 'Permitir Notif',
            value: notificationSettings.permitirNotif,
            onChanged: (value) {
              setState(() {
                notificationSettings.permitirNotif = value;
              });
            },
          ),
          buildSwitchListTile(
            title: 'Like Notif',
            value: notificationSettings.likeNotif,
            onChanged: (value) {
              setState(() {
                notificationSettings.likeNotif = value;
              });
            },
          ),
          buildSwitchListTile(
            title: 'Chat Notif',
            value: notificationSettings.chatNotif,
            onChanged: (value) {
              setState(() {
                notificationSettings.chatNotif = value;
              });
            },
          ),
          buildSwitchListTile(
            title: 'Recordatorio Notif',
            value: notificationSettings.recordatorioNotif,
            onChanged: (value) {
              setState(() {
                notificationSettings.recordatorioNotif = value;
              });
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      activeColor: Color(0xffffa31a),
      title: Text(title, style: TextStyle(color: Colors.white)),
      value: value,
      onChanged: onChanged,
    );
  }
}
