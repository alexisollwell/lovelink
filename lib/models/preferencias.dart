class preferenciasModel {
  int id ;
  int grupo;
  String interes;

  preferenciasModel({
    required this.id,
    required this.grupo,
    required this.interes,

  });
  factory preferenciasModel.fromJson(Map<String, dynamic> json) => preferenciasModel(
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