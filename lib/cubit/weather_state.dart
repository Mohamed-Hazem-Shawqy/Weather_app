import 'package:weather_app/model/weather_model.dart';

abstract class CubitState {}

class WeatherInit extends CubitState {}

class WeatherLoading extends CubitState {}

class WeatherSuccess extends CubitState {
  List<WeatherModel> weatherSave;
  WeatherSuccess({required this.weatherSave});
}

class WeatherFaluier extends CubitState {}

class SwitchOn extends CubitState {}

class SwitchOff extends CubitState {}
