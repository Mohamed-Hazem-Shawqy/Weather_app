import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/cubit/weaher_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/views/on_boarding.dart';

void main() async{
await dotenv.load(fileName: "api_key.env");
  runApp(BlocProvider(
      create: (context) => WeatherCubit(), child: const Weather()));
}

class Weather extends StatelessWidget {
  const Weather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, CubitState>(
      builder: (BuildContext context, state) {
        return MaterialApp(
          theme: ThemeData(
              brightness: BlocProvider.of<WeatherCubit>(context).mode
                  ? Brightness.dark
                  : Brightness.light,
              textTheme: TextTheme(
                  bodySmall: TextStyle(
                      fontSize: 15,
                      color: BlocProvider.of<WeatherCubit>(context).mode
                          ? Colors.white
                          : Colors.black),
                  bodyMedium: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  bodyLarge: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  displayLarge: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
          debugShowCheckedModeBanner: false,
          home: const OnBoarding(),
        );
      },
    );
  }
}
