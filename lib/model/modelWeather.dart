import 'dart:convert';

import 'package:flutter/foundation.dart';

class OpenWeather {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;
  OpenWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  OpenWeather copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    return OpenWeather(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'coord': coord.toMap(),
      'weather': weather.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'clouds': clouds.toMap(),
      'dt': dt,
      'sys': sys.toMap(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  factory OpenWeather.fromMap(Map<String, dynamic> map) {
    return OpenWeather(
      coord: Coord.fromMap(map['coord']),
      weather: List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x))),
      base: map['base'],
      main: Main.fromMap(map['main']),
      visibility: map['visibility']?.toInt(),
      wind: Wind.fromMap(map['wind']),
      clouds: Clouds.fromMap(map['clouds']),
      dt: map['dt']?.toInt(),
      sys: Sys.fromMap(map['sys']),
      timezone: map['timezone']?.toInt(),
      id: map['id']?.toInt(),
      name: map['name'],
      cod: map['cod']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OpenWeather.fromJson(String source) => OpenWeather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OpenWeather(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OpenWeather &&
      other.coord == coord &&
      listEquals(other.weather, weather) &&
      other.base == base &&
      other.main == main &&
      other.visibility == visibility &&
      other.wind == wind &&
      other.clouds == clouds &&
      other.dt == dt &&
      other.sys == sys &&
      other.timezone == timezone &&
      other.id == id &&
      other.name == name &&
      other.cod == cod;
  }

  @override
  int get hashCode {
    return coord.hashCode ^
      weather.hashCode ^
      base.hashCode ^
      main.hashCode ^
      visibility.hashCode ^
      wind.hashCode ^
      clouds.hashCode ^
      dt.hashCode ^
      sys.hashCode ^
      timezone.hashCode ^
      id.hashCode ^
      name.hashCode ^
      cod.hashCode;
  }
}

class Coord {
  final double lon;
  final double lat;
  Coord({
    required this.lon,
    required this.lat,
  });

  Coord copyWith({
    double? lon,
    double? lat,
  }) {
    return Coord(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lon: map['lon']?.toDouble(),
      lat: map['lat']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) => Coord.fromMap(json.decode(source));

  @override
  String toString() => 'Coord(lon: $lon, lat: $lat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Coord &&
      other.lon == lon &&
      other.lat == lat;
  }

  @override
  int get hashCode => lon.hashCode ^ lat.hashCode;
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id']?.toInt(),
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Weather &&
      other.id == id &&
      other.main == main &&
      other.description == description &&
      other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      main.hashCode ^
      description.hashCode ^
      icon.hashCode;
  }
}

class Main {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;
  Main({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
  });

  Main copyWith({
    double? temp,
    double? feels_like,
    double? temp_min,
    double? temp_max,
    int? pressure,
    int? humidity,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feels_like: feels_like ?? this.feels_like,
      temp_min: temp_min ?? this.temp_min,
      temp_max: temp_max ?? this.temp_max,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feels_like': feels_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp']?.toDouble(),
      feels_like: map['feels_like']?.toDouble(),
      temp_min: map['temp_min']?.toDouble(),
      temp_max: map['temp_max']?.toDouble(),
      pressure: map['pressure']?.toInt(),
      humidity: map['humidity']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) => Main.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Main(temp: $temp, feels_like: $feels_like, temp_min: $temp_min, temp_max: $temp_max, pressure: $pressure, humidity: $humidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Main &&
      other.temp == temp &&
      other.feels_like == feels_like &&
      other.temp_min == temp_min &&
      other.temp_max == temp_max &&
      other.pressure == pressure &&
      other.humidity == humidity;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
      feels_like.hashCode ^
      temp_min.hashCode ^
      temp_max.hashCode ^
      pressure.hashCode ^
      humidity.hashCode;
  }
}

class Wind {
  final double speed;
  final int deg;
  Wind({
    required this.speed,
    required this.deg,
  });

  Wind copyWith({
    double? speed,
    int? deg,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'deg': deg,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed']?.toDouble(),
      deg: map['deg']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) => Wind.fromMap(json.decode(source));

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Wind &&
      other.speed == speed &&
      other.deg == deg;
  }

  @override
  int get hashCode => speed.hashCode ^ deg.hashCode;
}

class Clouds {
  final int all;
  Clouds({
    required this.all,
  });

  Clouds copyWith({
    int? all,
  }) {
    return Clouds(
      all: all ?? this.all,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'all': all,
    };
  }

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Clouds.fromJson(String source) => Clouds.fromMap(json.decode(source));

  @override
  String toString() => 'Clouds(all: $all)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Clouds &&
      other.all == all;
  }

  @override
  int get hashCode => all.hashCode;
}

class Sys {
  final String country;
  final int sunrise;
  final int sunset;
  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  Sys copyWith({
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return Sys(
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      country: map['country'],
      sunrise: map['sunrise']?.toInt(),
      sunset: map['sunset']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sys.fromJson(String source) => Sys.fromMap(json.decode(source));

  @override
  String toString() => 'Sys(country: $country, sunrise: $sunrise, sunset: $sunset)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Sys &&
      other.country == country &&
      other.sunrise == sunrise &&
      other.sunset == sunset;
  }

  @override
  int get hashCode => country.hashCode ^ sunrise.hashCode ^ sunset.hashCode;
}