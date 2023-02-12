// To parse this JSON data, do
//
//     final climaModel = climaModelFromMap(jsonString);

import 'dart:convert';

class ClimaModel {
  ClimaModel({
    required this.cityName,
    required this.countryCode,
    required this.data,
    required this.lat,
    required this.lon,
    required this.stateCode,
    required this.timezone,
  });

  String cityName;
  String countryCode;
  List<Datum> data;
  String lat;
  String lon;
  String stateCode;
  String timezone;

  factory ClimaModel.fromJson(String str) =>
      ClimaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClimaModel.fromMap(Map<String, dynamic> json) => ClimaModel(
        cityName: json["city_name"],
        countryCode: json["country_code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        lat: json["lat"],
        lon: json["lon"],
        stateCode: json["state_code"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toMap() => {
        "city_name": cityName,
        "country_code": countryCode,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "lat": lat,
        "lon": lon,
        "state_code": stateCode,
        "timezone": timezone,
      };
}

class Datum {
  Datum({
    required this.appMaxTemp,
    required this.appMinTemp,
    required this.clouds,
    required this.cloudsHi,
    required this.cloudsLow,
    required this.cloudsMid,
    required this.datetime,
    required this.dewpt,
    required this.highTemp,
    required this.lowTemp,
    this.maxDhi,
    required this.maxTemp,
    required this.minTemp,
    required this.moonPhase,
    required this.moonPhaseLunation,
    required this.moonriseTs,
    required this.moonsetTs,
    required this.ozone,
    required this.pop,
    required this.precip,
    required this.pres,
    required this.rh,
    required this.slp,
    required this.snow,
    required this.snowDepth,
    required this.sunriseTs,
    required this.sunsetTs,
    required this.temp,
    required this.ts,
    required this.uv,
    required this.validDate,
    required this.vis,
    required this.weather,
    required this.windCdir,
    required this.windCdirFull,
    required this.windDir,
    required this.windGustSpd,
    required this.windSpd,
  });

  double appMaxTemp;
  double appMinTemp;
  int clouds;
  int cloudsHi;
  int cloudsLow;
  int cloudsMid;
  DateTime datetime;
  double dewpt;
  double highTemp;
  double lowTemp;
  dynamic maxDhi;
  double maxTemp;
  double minTemp;
  double moonPhase;
  double moonPhaseLunation;
  int moonriseTs;
  int moonsetTs;
  double ozone;
  int pop;
  double precip;
  double pres;
  int rh;
  double slp;
  int snow;
  int snowDepth;
  int sunriseTs;
  int sunsetTs;
  double temp;
  int ts;
  double uv;
  DateTime validDate;
  double vis;
  Weather weather;
  String windCdir;
  String windCdirFull;
  int windDir;
  double windGustSpd;
  double windSpd;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        appMaxTemp: json["app_max_temp"]?.toDouble(),
        appMinTemp: json["app_min_temp"]?.toDouble(),
        clouds: json["clouds"],
        cloudsHi: json["clouds_hi"],
        cloudsLow: json["clouds_low"],
        cloudsMid: json["clouds_mid"],
        datetime: DateTime.parse(json["datetime"]),
        dewpt: json["dewpt"]?.toDouble(),
        highTemp: json["high_temp"]?.toDouble(),
        lowTemp: json["low_temp"]?.toDouble(),
        maxDhi: json["max_dhi"],
        maxTemp: json["max_temp"]?.toDouble(),
        minTemp: json["min_temp"]?.toDouble(),
        moonPhase: json["moon_phase"]?.toDouble(),
        moonPhaseLunation: json["moon_phase_lunation"]?.toDouble(),
        moonriseTs: json["moonrise_ts"],
        moonsetTs: json["moonset_ts"],
        ozone: json["ozone"]?.toDouble(),
        pop: json["pop"],
        precip: json["precip"]?.toDouble(),
        pres: json["pres"]?.toDouble(),
        rh: json["rh"],
        slp: json["slp"]?.toDouble(),
        snow: json["snow"],
        snowDepth: json["snow_depth"],
        sunriseTs: json["sunrise_ts"],
        sunsetTs: json["sunset_ts"],
        temp: json["temp"]?.toDouble(),
        ts: json["ts"],
        uv: json["uv"]?.toDouble(),
        validDate: DateTime.parse(json["valid_date"]),
        vis: json["vis"]?.toDouble(),
        weather: Weather.fromMap(json["weather"]),
        windCdir: json["wind_cdir"],
        windCdirFull: json["wind_cdir_full"],
        windDir: json["wind_dir"],
        windGustSpd: json["wind_gust_spd"]?.toDouble(),
        windSpd: json["wind_spd"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "app_max_temp": appMaxTemp,
        "app_min_temp": appMinTemp,
        "clouds": clouds,
        "clouds_hi": cloudsHi,
        "clouds_low": cloudsLow,
        "clouds_mid": cloudsMid,
        "datetime":
            "${datetime.year.toString().padLeft(4, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}",
        "dewpt": dewpt,
        "high_temp": highTemp,
        "low_temp": lowTemp,
        "max_dhi": maxDhi,
        "max_temp": maxTemp,
        "min_temp": minTemp,
        "moon_phase": moonPhase,
        "moon_phase_lunation": moonPhaseLunation,
        "moonrise_ts": moonriseTs,
        "moonset_ts": moonsetTs,
        "ozone": ozone,
        "pop": pop,
        "precip": precip,
        "pres": pres,
        "rh": rh,
        "slp": slp,
        "snow": snow,
        "snow_depth": snowDepth,
        "sunrise_ts": sunriseTs,
        "sunset_ts": sunsetTs,
        "temp": temp,
        "ts": ts,
        "uv": uv,
        "valid_date":
            "${validDate.year.toString().padLeft(4, '0')}-${validDate.month.toString().padLeft(2, '0')}-${validDate.day.toString().padLeft(2, '0')}",
        "vis": vis,
        "weather": weather.toMap(),
        "wind_cdir": windCdir,
        "wind_cdir_full": windCdirFull,
        "wind_dir": windDir,
        "wind_gust_spd": windGustSpd,
        "wind_spd": windSpd,
      };
}

class Weather {
  Weather({
    required this.icon,
    required this.description,
    required this.code,
  });

  String icon;
  String description;
  int code;

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        icon: json["icon"],
        description: json["description"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "icon": icon,
        "description": description,
        "code": code,
      };
}
