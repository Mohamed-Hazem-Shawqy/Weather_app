import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weaher_cubit.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController country = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('enter your city'),
      ),
      body: Center(
        child: Form(
          key: key,
          child: TextFormField(
            style: Theme.of(context).textTheme.bodySmall,
            controller: country,
            validator: (value) {
              if (value!.isEmpty) {
                return "this field can't be empty";
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: 'country',
                suffix: IconButton(
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        BlocProvider.of<WeatherCubit>(context)
                            .getWeather(country.text);

                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.search)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      ),
    );
  }
}
