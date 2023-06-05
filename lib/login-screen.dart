import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_multirolebase_app/student-screen.dart';
import 'package:shared_preferences_multirolebase_app/teacher-screen.dart';

import 'home-screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(hintText: 'password'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'age'),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              //SharedPreferences  are used to store user data eg. emial, password etc
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                //admin, student, teacher
                sp.setString('userType', 'teacher');
                sp.setBool('isLogin', true);
                if(sp.getString('userType')=='teacher'){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TeacherScreen()));

                }
                else if(sp.getString('userType')=='student'){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));

                }
                else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));

                }
                  // sp.setString('name', 'safa anwar');//initialization
                // sp.setInt('age', 23);
                // sp.setBool('isLogin', false);
                //
                // print(sp.getString('name'));//printing the initialized values
                // print(sp.getInt('age').toString());
                // print(sp.getBool('isLogin').toString());
                //
                // sp.remove('name');// remove initialized values
                // print(sp.getString('name'));// varifying the deleted values
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.teal,
                  child: const Center(
                    child: Text('Sign Up'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
