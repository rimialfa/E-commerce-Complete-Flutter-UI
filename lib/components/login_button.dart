import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final Function loginMethod;

  const LoginButton(
      {super.key,
      required this.text,
      required this.color,
      required this.icon,
      required this.loginMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
          onPressed: () => loginMethod(),
          icon: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(24),
            backgroundColor: color,
          ),
          label: Text(
            text,
            textAlign: TextAlign.center,
          )),
    );
  }
}
