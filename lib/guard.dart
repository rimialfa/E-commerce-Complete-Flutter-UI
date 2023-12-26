import 'package:flutter/material.dart';
import 'package:app/screens/init_screen.dart';
import 'package:app/screens/sign_in/sign_in_screen.dart';
import 'package:app/services/auth.dart';

class Guard extends StatelessWidget {
  const Guard({super.key});
  static String routeName = "/guard";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
          stream: AuthService().userStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            } else if (snapshot.hasData) {
              return const InitScreen();
            } else {
              return const SignInScreen();
            }
          }),
    );
  }
}
