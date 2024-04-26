import 'dart:async';

import 'package:easy_lib/src/features/authentication/view/login_screen.dart';
import 'package:easy_lib/src/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late String token ;
  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token  = prefs.getString("x-auth-token") ?? "";

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPrefs();
    Timer(const Duration(seconds: 2) , () {
     if(token == ""){
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);

     }
     else{
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home(token: token)), (route) => false);
     }


    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/favicon.png',height:200,width: 200,)
          ],
        ),
      ),
    );
  }
}
