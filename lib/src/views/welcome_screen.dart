import 'package:flutter/material.dart';

import '../theme/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: ElevatedButton(
          onPressed: () {},
          child: Container(
            width: 382,
            height: 56,
            decoration: const BoxDecoration(
              color: Color(0xFFFF7F7D),
            ),
            child: Center(
              child: Text(
                "Vamos começar",
                style: redtitle2Style,
              ),
            ),
          ),
        )),
      ),
    );
  }
}
