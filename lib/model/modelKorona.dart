import 'dart:convert';

class Corona {
  final String name;
  final String positif;
  final String sembuh;
  final String meninggal;
  final String dirawat;
  Corona({
    required this.name,
    required this.positif,
    required this.sembuh,
    required this.meninggal,
    required this.dirawat,
  });

  Corona copyWith({
    String? name,
    String? positif,
    String? sembuh,
    String? meninggal,
    String? dirawat,
  }) {
    return Corona(
      name: name ?? this.name,
      positif: positif ?? this.positif,
      sembuh: sembuh ?? this.sembuh,
      meninggal: meninggal ?? this.meninggal,
      dirawat: dirawat ?? this.dirawat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'positif': positif,
      'sembuh': sembuh,
      'meninggal': meninggal,
      'dirawat': dirawat,
    };
  }

  factory Corona.fromMap(Map<String, dynamic> map) {
    return Corona(
      name: map['name'],
      positif: map['positif'],
      sembuh: map['sembuh'],
      meninggal: map['meninggal'],
      dirawat: map['dirawat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Corona.fromJson(String source) => Corona.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Corona(name: $name, positif: $positif, sembuh: $sembuh, meninggal: $meninggal, dirawat: $dirawat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Corona &&
      other.name == name &&
      other.positif == positif &&
      other.sembuh == sembuh &&
      other.meninggal == meninggal &&
      other.dirawat == dirawat;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      positif.hashCode ^
      sembuh.hashCode ^
      meninggal.hashCode ^
      dirawat.hashCode;
  }
}