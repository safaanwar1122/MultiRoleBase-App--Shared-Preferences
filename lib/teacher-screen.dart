import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login-screen.dart';
class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  String email = '', age = '',type='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? ''; //if email is empty assign null to it
    age = sp.getString('age') ?? '';
    type=sp.getString('userType')??'';
    // use set state to rebuild screen agter getting emaill, age
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('email'),
                Text(email.toString()),
              ],
            ),
          ),const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('age'),
                Text(age.toString()),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('YserType'),
                Text(type.toString()),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            //SharedPreferences  are used to store user data eg. emial, password etc
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear(); //using clear in single statement all data will be lost but by removing you need to remove each key value separately
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));

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
                  child: Text('Log Out'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
