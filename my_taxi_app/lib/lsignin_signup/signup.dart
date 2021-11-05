import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:my_taxi_app/main.dart';

class Signup extends StatelessWidget {
  static const String idScreen = "register";
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(0.8),
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(100, 60, 100, 0),
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/logo1.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: nameTextEditingController,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Full Name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: const Color(0xFF3366FF),
                      ),
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: phoneTextEditingController,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Phone",
                      prefixIcon: Icon(
                        Icons.phone,
                        color: const Color(0xFF3366FF),
                      ),
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: emailTextEditingController,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.mail,
                        color: const Color(0xFF3366FF),
                      ),
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: passwordTextEditingController,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "PasseWord",
                      prefixIcon: Icon(
                        Icons.password,
                        color: const Color(0xFF3366FF),
                      ),
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    child: Text("Creat"),
                    onPressed: () {
                      // if (nameTextEditingController.text.length < 5) {
                      //   displayToastMassege(
                      //       "name must be atleast 4 charcters", context);
                      // } else if (!emailTextEditingController.text
                      //     .contains('@')) {
                      //   displayToastMassege("enter valid Email", context);
                      // } else if (phoneTextEditingController.text.isEmpty) {
                      //   displayToastMassege(
                      //       "please enter your phone number ", context);
                      // } else if (passwordTextEditingController.text.length <
                      //     4) {
                      //   displayToastMassege(
                      //       "password must be atleast 4 charcters", context);
                      // } else {
                        registerNewUser(context);
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height / 1,
            width: double.infinity,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color.fromRGBO(8, 25, 113, 1),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
      ]),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      // displayToastMassege("massege" + errMsg.toString(), context);
    }))
        .user;
    if (firebaseUser != null) {
      // print("jawkbeh");

      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
        //  "password": passwordTextEditingController,
      };
      usersRef.child(firebaseUser.uid).set(userDataMap);
      // displayToastMassege("user has been created", context);
    } else {
      //print("ohhhhhh");
      // displayToastMassege("user is not created", context);
    }
  }
}

// displayToastMassege(String massege, BuildContext context) {
//   Fluttertoast.showToast(msg: massege);
// }
