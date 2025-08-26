
import 'package:api_task_list2/auth_provider_class.dart';
import 'package:api_task_list2/splace_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthProviderClass(),)
  ],child: MaterialApp(home: SplaceScreen(),debugShowCheckedModeBanner: false,),));
}