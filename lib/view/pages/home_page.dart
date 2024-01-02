import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/waether_bloc.dart';
import 'package:weather_app_bloc/model/main_model/current_weather_model.dart';
import 'package:weather_app_bloc/model/main_model/five_days_model.dart';
import 'package:weather_app_bloc/view/widgets/text_field.dart';

import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var heightPage = MediaQuery.of(context).size.height;
    var widthPage = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is SuccessGetingCurrentWeatherData) {
                CurrentWeatherModel data = state.data;
                FiveDaysModel data1 = state.data1;
                return SafeArea(
                  child: Column(
                    children: [
                      Container(
                        height: heightPage * 0.45,
                        child: Stack(
                          children: [
                            Container(
                              width: widthPage,
                              height: heightPage * 0.28,
                              alignment: Alignment.topCenter,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black38, BlendMode.darken),
                                  image: AssetImage(
                                      'assets/images/cloud-in-blue-sky.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(35),
                                ),
                              ),
                              child: MyTextFormField(controller: controller),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: widthPage * 0.9,
                                height: heightPage * 0.27,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      data.name,
                                      style: const TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      DateFormat.MMMEd()
                                          .format(DateTime.now())
                                          .toString(),
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: heightPage * 0.27 * 0.57,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                data.weather[0].description,
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "${data.main.temp.round() - 273}℃",
                                                style: const TextStyle(
                                                    fontSize: 50),
                                              ),
                                              Text(
                                                "min ${data.main.temp_min.round() - 273}℃ / max ${data.main.temp_min.round() - 273}℃",
                                                style: const TextStyle(
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Icon(
                                                Icons.sunny,
                                                size: 90,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                "wind ${data.wind.speed.round()} m/s",
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      //-------------------------------------
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Other city",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        width: widthPage,
                        height: heightPage * 0.2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 10, left: 10, bottom: 10),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                      )
                                    ]),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Ismailla"),
                                    Text("19 ℃"),
                                    Icon(
                                      Icons.sunny,
                                      size: 50,
                                      color: Colors.amber,
                                    ),
                                    Text("Cleare sky"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is NoEnternetWeatherData) {
                return const Center(
                  child: Text('Sorry , There is No Internet'),
                );
              } else if (state is ErrorWeatherData) {
                return const Center(
                  child: Text('Error'),
                );
              } else if (state is LoadingWeatherData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: IconButton(
                      onPressed: () {
                        context
                            .read<WeatherBloc>()
                            .add(GetCurrentWeatherData());
                        context.read<WeatherBloc>().add(GetFiveOther());
                      },
                      icon: const Icon(Icons.replay_outlined)),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
