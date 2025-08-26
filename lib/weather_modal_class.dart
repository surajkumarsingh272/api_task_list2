class WeatherModal {
  String? cityName;
  String? temp;
  String? feelsLike;
  String? tempMin;
  String? tempMax;
  String? pressure;
  String? humidity;
  String?sea_level;
  String?grnd_level;
  String? windSpeed;
  String? windDeg;
  String? windGust;

  WeatherModal(this.cityName, this.temp, this.feelsLike, this.tempMin,this.tempMax,this.pressure, this.humidity, this.sea_level,this.grnd_level,  this.windSpeed, this.windDeg, this.windGust,);

  static WeatherModal fromJson(Map<String, dynamic> json) {
    return WeatherModal(
      json["name"].toString(),
      json["main"]["temp"].toString(),
      json["main"]["feels_like"].toString(),
      json["main"]["temp_min"].toString(),
      json["main"]["temp_max"].toString(),
      json["main"]["pressure"].toString(),
      json["main"]["humidity"].toString(),
      json["main"]["sea_level"].toString(),
      json["main"]["grnd_level"].toString(),
      json["wind"]["speed"].toString(),
      json["wind"]["deg"].toString(),
      json["wind"]["gust"].toString(),
    );
  }
}
