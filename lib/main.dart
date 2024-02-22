import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Feature/Screens/Splash/splash.dart';
import 'package:quiz_app/Provider/home_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance();
  // await prefs.setBool("logged", false);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => HomeProvider()
          ..fetchUserImage()
          ..getScore()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: SplashPage(),
    );
  }
}
