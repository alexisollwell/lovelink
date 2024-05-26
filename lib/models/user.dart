class User{
  String email, phone, name;
  int? age;

  User({
    required this.name,
    required this.email,
    required this.phone,
    this.age,
  });
}