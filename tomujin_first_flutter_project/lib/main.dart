import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tomujin_first_flutter_project/pages/my_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DBHelper.initDb();

  runApp(
    const MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'flutter demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
