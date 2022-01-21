import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locafrog/app/modules/auth/services/auth_service.dart';
import 'package:flutter_locafrog/app/modules/splash/services/splash_service.dart';
import 'package:flutter_locafrog/app/modules/splash/views/splash_view.dart';
import 'package:flutter_locafrog/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialBinding: BindingsBuilder(
        () {
          Get.put(AuthService());
          // Get.put(SplashService());
        },
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // builder: (context, child) {
      //   return FutureBuilder<void>(
      //     key: const ValueKey('initFuture'),
      //     future: Get.find<SplashService>().init(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         return child ?? const SizedBox.shrink();
      //       }
      //       return const SplashView();
      //     },
      //   );
      // },
    );
  }
}
