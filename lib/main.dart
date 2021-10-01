
import 'package:daily_vity/appearance/colorLib.dart';
import 'package:daily_vity/ui/splashScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/modelCatatan.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox('noteBox');
  runApp(MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({ Key ? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyVity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorLib.dailyVityBlue,
        
      ),
      home: SplashScreenPage(),
    );
  }
}