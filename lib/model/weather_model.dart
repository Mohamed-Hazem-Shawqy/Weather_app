class WeatherModel {
  final String name;
  final double temp;
  final double minTemp;
  final double maxtemp;
  final String text;
  final String icon;
  final String date;
  WeatherModel({
    required this.name,
    required this.temp,
    required this.text,
    required this.icon,
    required this.date,
    required this.minTemp,
    required this.maxtemp,
  });

  factory WeatherModel.get(Map json, int index) {
    return WeatherModel(
      name: json['location']['name'],
      temp: json['current']['temp_c'],
      text: json['forecast']['forecastday'][index]['day']['condition']['text'],
      icon: json['forecast']['forecastday'][index]['day']['condition']['icon'],
      date: json['forecast']['forecastday'][index]['date'],
      minTemp: json['forecast']['forecastday'][index]['day']['mintemp_c'],
      maxtemp: json['forecast']['forecastday'][index]['day']['maxtemp_c'],
    );
  }
}
