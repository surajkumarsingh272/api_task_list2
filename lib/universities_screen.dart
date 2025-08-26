
import 'package:api_task_list2/auth_provider_class.dart';
import 'package:api_task_list2/kistu_screen.dart';
import 'package:api_task_list2/weather_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UniversitiesScreen extends StatelessWidget {
  const UniversitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UniversitiesScreen"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Consumer<AuthProviderClass>(builder: (context, value, child) {
                if(value.dataList.isEmpty){
                  return Center(child: CircularProgressIndicator(),);
                }
                return  ListView.builder(
                  itemCount: value.dataList.length,
                  itemBuilder: (context, index) {
                    var data=value.dataList[index];
                    return Card(
                      child: ListTile(
                        title: Text("${data.slug}"),
                        subtitle: Text( "${data.synopsis}",maxLines: 3, overflow: TextOverflow.ellipsis,),
                      ),
                    );
                  },);
              },),
            ),

            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => KistuScreen(),));
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                   minimumSize: Size(double.infinity, 40)
                ),
                child: Text("kistu Api")),

            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherApi(),));
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 40)
                ),
                child: Text("Weather Api"))
          ],
        ),
      ),
    );
  }
}
