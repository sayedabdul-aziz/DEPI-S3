class Governorate {
  int? id;
  String? governorateNameEn;

  Governorate({this.id, this.governorateNameEn});

  factory Governorate.fromJson(Map<String, dynamic> json) => Governorate(
    id: json['id'] as int?,
    governorateNameEn: json['governorate_name_en'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'governorate_name_en': governorateNameEn,
  };
}
