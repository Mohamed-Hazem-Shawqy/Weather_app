import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/services.dart';

class WeatherCubit extends Cubit<CubitState> {
  WeatherCubit() : super(WeatherInit());
  bool mode = false;
  Services services=Services();

  void getWeather(String country) async {
    emit(WeatherLoading());
    try {
      List<WeatherModel> saveWeather = await services.getApi(country);
      emit(WeatherSuccess(weatherSave: saveWeather));
    } on Exception {
      emit(WeatherFaluier());
    }
  }

  void switchState() {
    if (mode == false) {
      emit(SwitchOff());
    } else {
      emit(SwitchOn());
    }
  }
}
