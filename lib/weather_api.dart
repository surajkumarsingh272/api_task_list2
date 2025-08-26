import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider_class.dart';

class WeatherApi extends StatefulWidget {
  const WeatherApi({super.key});

  @override
  State<WeatherApi> createState() => _WeatherApiState();
}

class _WeatherApiState extends State<WeatherApi> {
@override
  void initState() {
  Provider.of<AuthProviderClass>(context,listen: false).secondGetDataWeather();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather api screen"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Consumer<AuthProviderClass>(
                builder: (context, value, child) {
                  if (value.weatherData.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: value.weatherData.length,
                    itemBuilder: (context, index) {
                      var data = value.weatherData[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Descripition: broken clouds",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                          SizedBox(height: 20,),
                          Text("Main",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Card(
                            color: Colors.white,
                            child: ListTile(
                              title: Text("${data.cityName}"),
                              subtitle: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                     "Temp: ${data.temp}°C\n"
                                        "Feels Like: ${data.feelsLike}°C\n"
                                        "Min: ${data.tempMin}°C,\n Max: ${data.tempMax}°C\n"
                                        "Pressure: ${data.pressure} \n Humidity: ${data.humidity}\n%"
                                        "grnd_level :${data.grnd_level}\n sea_level: ${data.sea_level}\n "
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 50,),
                          Text("Visibilty:  1000000",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                          SizedBox(height: 20,),
                          Text("Wind",style: TextStyle(fontSize: 20,color:Colors.blue,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Container(
                            width: double.infinity,
                            height: 100,
                            color: Colors.white,
                            child: Center(
                              child: Text("speed :${data.windSpeed}\n deg: ${data.windDeg} \n" "gust :${data.windGust}\n "),
                            ),
                          )
                        ],
                      );

                    },
                  );
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}


