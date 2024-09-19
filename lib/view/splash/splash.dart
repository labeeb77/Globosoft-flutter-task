import 'package:flutter/material.dart';
import 'package:globosoft_test/view/home/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
  
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Text('E - SHOP',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white),), // Loading indicator
      ),
    );
  }
}
