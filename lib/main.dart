import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/modules/auth/services/auth_service.dart';
import 'firebase_options.dart';
import 'package:flutter_locafrog/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // for environment variable
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthService());
  });
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
          // Get.put(SplashService());
        },
      ),
      title: "Application",
      initialRoute: AuthService.to.isLoggedIn ? AppPages.INITIAL : Routes.LOGIN,
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
