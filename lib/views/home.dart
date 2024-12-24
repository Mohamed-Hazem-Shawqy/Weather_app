import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weaher_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/custom/weathet_data.dart';
import 'package:weather_app/views/search.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<WeatherCubit, CubitState>(
          builder: (BuildContext context, state) {
            return Switch(
                value: BlocProvider.of<WeatherCubit>(context).mode,
                onChanged: (val) {
                  BlocProvider.of<WeatherCubit>(context).mode = val;
                  BlocProvider.of<WeatherCubit>(context).switchState();
                });
          },
        
          
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Search()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, CubitState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            return WeatherData(weatherModel: state.weatherSave);
          } else if (state is WeatherFaluier) {
            return const Center(child: Text('Something went wrong'));
          } else {
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/weather.png'),
                    const SizedBox(height: 30),
                    const Text(
                      'You must choose country first',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
