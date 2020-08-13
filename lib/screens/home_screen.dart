import 'package:fingerprint/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class HomeScreen extends StatelessWidget {
  final LocalAuthentication localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () async {
        bool weCanCheckBiometrics = await localAuth.canCheckBiometrics;

        if (weCanCheckBiometrics) {
          bool authenticated = await localAuth.authenticateWithBiometrics(
            localizedReason: "Authenticate to see my Profile.",
          );

          if (authenticated) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardScreen(),
              ),
            );
          }
        }
      },
      child: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: new AssetImage("assets/undraw.co/tap.png"),
          fit: BoxFit.fill,
        )),
      ),
    ));
  }
}
