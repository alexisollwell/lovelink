class MatchPerson{
  String name,photo,gender;
  int id,age;
  String? description;

  MatchPerson({
    required  this.age,
    required this.gender,
    required this.photo,
    required this.id,
    required this.name,
    this.description
  });
}