import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourapp/ui/route/route.dart';
import 'package:tourapp/views/splash_screen.dart';

import 'const/app_colors.dart';
import 'const/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    name: 'newshelter',
    options: FirebaseOptions(
        apiKey: "AIzaSyC-fj8IaxtEOCyLIZu2YrrUMRayNap_rd0",
        appId: "1:245068900773:ios:d798d3835a2ff42735e04c",
        messagingSenderId: "245068900773",
        projectId: "newshelter-3a1b1"),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        //Initialize FlutterFire
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          //Once complete , show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          }
          //Otherwise, show something whilst waiting for initialization to complete
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(),
          ),
          scaffoldBackgroundColor: AppColors.scaffoldColor,
        ),
        initialRoute: splash,
        getPages: getPages,
        home: const SplashScreen(),
      ),
    );
  }
}
