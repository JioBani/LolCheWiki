import 'package:app/Service/GameDataService.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Palette.green,
          dialogTheme: const DialogTheme(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
          ),
          //useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}