import 'package:app/Service/GameDataService.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Service/ProfileService.dart';
import 'firebase_options.dart';

import 'View/Home/HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var gameDataService = Get.put(GameDataService());
  var profileService = Get.put(ProfileService());

  gameDataService.fetchData();
  profileService.fetchData();

  runApp(const MyApp());

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Palette.green
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}