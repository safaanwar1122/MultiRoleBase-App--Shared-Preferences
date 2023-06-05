import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_multirolebase_app/student-screen.dart';
import 'package:shared_preferences_multirolebase_app/teacher-screen.dart';

import 'home-screen.dart';
import 'login-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();

  }
  // in _SplashScreen it will check if user is already login move it to home screen else move it to login screen
  void isLogin()async{
    SharedPreferences sp=await  SharedPreferences.getInstance();
    bool isLogin=sp.getBool('isLogin')??false;
    // assign it equal to false bcz this bool value can't be null if null it will be equal to false

    String userType=sp.getString('userType')??'';

    if(isLogin){
      if(userType=='student'){
        Timer(Duration(seconds: 3),(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));
        });
      }
      else if(userType=='teacher'){
        Timer(Duration(seconds: 3),(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherScreen()));
        });
      }
      else {
        Timer(Duration(seconds: 3),(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        });
      }

 }
 else {
   Timer(Duration(seconds: 3),(){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
   });
 }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitWidth,
        image: NetworkImage('https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ),
    );
  }
}
