import 'dart:core';

class Notificacion {
  bool permitirNotif;
  bool likeNotif;
  bool chatNotif;
  bool recordatorioNotif;

  Notificacion({
    this.permitirNotif = false,
    this.likeNotif = false,
    this.chatNotif = false,
    this.recordatorioNotif = false,
  });

  Notificacion.fromJson(Map<String, dynamic> json)
      : permitirNotif = json['permitirNotif'],
        likeNotif = json['likeNotif'],
        chatNotif = json['chatNotif'],
        recordatorioNotif = json['recordatorioNotif'];

  Map<String, dynamic> toJson() => {
    'permitirNotif': permitirNotif,
    'likeNotif': likeNotif,
    'chatNotif': chatNotif,
    'recordatorioNotif': recordatorioNotif,
  };
}