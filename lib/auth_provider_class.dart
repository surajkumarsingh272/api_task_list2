import 'package:api_task_list2/auth_api_helper.dart';
import 'package:api_task_list2/auth_modal.dart';
import 'package:api_task_list2/weather_modal_class.dart';
import 'package:flutter/widgets.dart';


class AuthProviderClass with ChangeNotifier{

  AuthProviderClass(){
    secondGetDataKistu();
  }

    List<AuthModalClass> dataList=[];
   List<WeatherModal> weatherData=[];

    secondGetDataKistu()async{
      var data=await ProductApiHelper.firstAllKistuApiData();
      if(data!=null){
        dataList.clear();
        dataList.addAll(data);
        notifyListeners();
      }
    }

  secondGetDataWeather() async {
    var data = await ProductApiHelper.secondGetAllWeatherApiData();
    if (data != null) {
      weatherData.clear();
      weatherData.add(data);
      notifyListeners();
    }
  }

}