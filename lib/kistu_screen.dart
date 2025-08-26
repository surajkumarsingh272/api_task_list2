import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider_class.dart';

class KistuScreen extends StatefulWidget {
  const KistuScreen({super.key});

  @override
  State<KistuScreen> createState() => _KistuScreenState();
}

class _KistuScreenState extends State<KistuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kistu api screen"),
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

          ],
        ),
      ),
    );
  }
}
