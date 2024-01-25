import 'package:app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/firebase_options.dart';
import 'package:app/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alsafa Humanity',
        theme: AppTheme.lightTheme(context),
        // initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
