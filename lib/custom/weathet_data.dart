import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherData extends StatelessWidget {
  final List<WeatherModel> weatherModel;
  const WeatherData({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/cloud.jpeg"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " ${weatherModel[index].name}",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 50),
              Container(
                  margin: const EdgeInsets.all(20),
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xff5174ae),
                      Color(0xff3272d3),
                    ]),
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(" ${weatherModel[index].text}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 21, 0, 248),
                            fontSize: 18,
                          )),
                      const SizedBox(height: 10),
                      Text(weatherModel[index].date.substring(0, 10)),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https:${weatherModel[index].icon}"),
                          ),
                          Text(
                            " ${weatherModel[index].temp}\u00B0C",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 53, 100, 138),
                          Color.fromARGB(174, 33, 149, 243)
                        ]),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const Text("Min"),
                        Text("${weatherModel[index].minTemp}\u00B0C"),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Colors.pinkAccent,
                          Color.fromARGB(255, 237, 106, 150)
                        ]),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const Text("Max"),
                        Text("${weatherModel[index].maxtemp}\u00B0C"),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      itemCount: 3,
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }
}
