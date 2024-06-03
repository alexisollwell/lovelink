class requestPassword{
  int id;
  String actualPassword, newPassword;

  requestPassword({
    required this.id,
    required this.actualPassword,
    required this.newPassword,
});

  factory requestPassword.fromJson(Map<String, dynamic> json) => requestPassword(
      id: json['id'],
      actualPassword: json['actualPassword'],
      newPassword: json['newPassword']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'actualPassword': actualPassword,
    'newPassword' : newPassword,
  };
}