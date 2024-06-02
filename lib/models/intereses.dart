class interesesModel {

  int id ;
  int grupo;
  String interes;

  interesesModel({
    required this.id,
    required this.grupo,
    required this.interes,

  });
  factory interesesModel.fromJson(Map<String, dynamic> json) => interesesModel(
    id: json['id'],
    grupo: json['grupo'],
    interes: json['interes'],
  );
  Map<String, dynamic> toJson() => {
    'id': id,
    'grupo': grupo,
    'interes': interes,
  };
}
