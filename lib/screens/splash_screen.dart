import 'package:check_in_champ/screens/home_screen.dart';
import 'package:check_in_champ/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);


    return authService.currentUser == null
        ? const LoginScreen() :
        const HomeScreen();

  }
}
