class CatFactModel {
  String? fact;
  DateTime? datetime;

  CatFactModel(this.fact, this.datetime);

  factory CatFactModel.fromMap(Map<dynamic, dynamic> json) =>
      CatFactModel(json['fact'], DateTime.now());

  Map<dynamic, dynamic> toMap() => {'fact': fact, 'datetime': datetime};
}
