import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_taxi_app/lsignin_signup/maps.dart';
import 'package:my_taxi_app/lsignin_signup/signup.dart';
import 'package:my_taxi_app/main.dart';

void main() => runApp(Loginscreen());

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
//-----------------------------------------------------------------dialog forget password-----------------
  Future<void> showInformationDialogdelete(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              titlePadding: EdgeInsets.all(0),
              title: Container(
                child: Center(
                    child: Text(
                  "Mot de passe oublier",
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                )),
                height: 50.00,
                width: 300.00,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(8, 25, 113, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              content: TextFormField(
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Color.fromRGBO(8, 25, 113, 1),
                  ),
                  hintStyle: TextStyle(fontSize: 15),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.name,
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(60, 10, 60, 0),
                  width: 200,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Color.fromRGBO(8, 25, 113, 1),
                    child: Text("envoyer"),
                    onPressed: () async {
                      // forget(email1);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Forget()),
                      // );
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

//--------------------------------------------------------------------------------------------------------
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          child: ListView(children: [
            Container(
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
                        hintText: "Mot de passe",
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
                  Container(
                      margin: EdgeInsets.fromLTRB(180, 0, 0, 5),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'mot de passe oublié ? ',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  await showInformationDialogdelete(context);
                                },
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      child: Text("Connexion"),
                      onPressed: () {
                        LoginAndAuthUser(context);
                        if (!emailTextEditingController.text.contains('@')) {
                          // displayToastMassege("enter valid Email", context);
                        } else if (passwordTextEditingController.text.isEmpty) {
                          // displayToastMassege(
                          //  "password must be atleast 4 charcters", context);
                        } else {}
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapScreen()),
                        );
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
                  SizedBox(
                    height: 200,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "vous n'avez pas de compte?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: "  s'insecrire",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()),
                                );
                              },
                            style: TextStyle(
                              color: Colors.blue,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              height: 900,
              width: 600,
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
          ]),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void LoginAndAuthUser(BuildContext context) async {
    final User FirebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      // displayToastMassege("massege" + errMsg.toString(), context);
      print("error");
    }))
        .user;
    if (FirebaseUser != null) {
      usersRef.child(FirebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          print("hafeli w snin deyma ");
          // displayToastMassege("you are logged-in now", context);
        } else {
          _firebaseAuth.signOut();
          // displayToastMassege("check your email or password", context);
          print("zid thabet ");
        }
      });
      // displayToastMassege("user has been created", context);
    } else {
      print("ohhhhhh");
      // displayToastMassege("Error", context);
    }
  }
}
