class User{
  String email, phone, name, password;
  int? age;
  int id;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.age,
  });
}

/*
* id usuario
* contraseña actual
* contraseña nueva }
* */