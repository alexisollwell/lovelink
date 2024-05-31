class User{
  String email, phone, name, password;
  int? age;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.age,
  });
}