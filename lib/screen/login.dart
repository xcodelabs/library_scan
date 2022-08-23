import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_scan/screen/home.dart';
import 'package:library_scan/screen/primary.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  DatabaseReference database = FirebaseDatabase.instance.ref();
  bool passvis = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool btStatus = false; // to check button click working is completed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: const Color(0xFFF9E5DE),
      body: SafeArea(
        child: Center(
          child: ListView(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon Logo
              SizedBox(
                height: 60,
              ),
              Center(
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.dribbble.com/users/458522/screenshots/16171869/media/0c5b235e80c42db71c2567d8a04625ac.png'),
                  radius: 60.0,
                ),
              ),

              const SizedBox(
                height: 5.0,
              ),

              //greeting text

              Center(
                child: Text(
                  "CEMP Library",
                  style: GoogleFonts.secularOne(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2F1500),
                  ),
                ),
              ),

              const SizedBox(
                height: 5.0,
              ),

              Center(
                child:
                    const Text('Welcome back, you\n Make your survey easier.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        )),
              ),

              SizedBox(
                height: 40.0,
              ),

              //email text field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: InputBorder.none,
                        hintText: 'Enter your Email',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),

              //password text field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: password,
                      obscureText: passvis,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (passvis) {
                                passvis = false;
                              } else {
                                passvis = true;
                              }
                            });
                          },
                          icon: (passvis)
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        hintText: 'Enter your password',
                      ),
                    ),
                  ),
                ),
              ),

              //login button
              const SizedBox(
                height: 20.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: InkWell(
                  onTap: () {
                    if (email.text == '') {
                      Fluttertoast.showToast(msg: 'Please Fill Email');
                    } else if (password == '') {
                      Fluttertoast.showToast(msg: 'Please Fill password');
                    } else if (email.text != '' &&
                        password.text != '' &&
                        !btStatus) {
                      _scaffoldkey.currentState!
                          .showSnackBar(SnackBar(content: Text('Please wait')));
                      btStatus = true;
                      database
                          .child('USER')
                          .orderByChild('EMAIL')
                          .equalTo(email.text.trim())
                          .once()
                          .then((value) {
                        // Fluttertoast.showToast(msg: 'checking');
                        if (value.snapshot.exists) {
                          //Fluttertoast.showToast(msg: 'checking -1 ');
                          for (var sn in value.snapshot.children) {
                            //print(sn.child('PASSWORD').value);
                            if (sn.child('PASSWORD').value ==
                                password.text.trim()) {
                              String name = sn.child('NAME').value.toString();
                              _scaffoldkey.currentState!.showSnackBar(
                                  SnackBar(content: Text('Welcome $name')));
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => primary())));
                              btStatus = false;
                            } else {
                              Fluttertoast.showToast(msg: 'invalid Credential');
                              btStatus = false;
                            }
                          }
                        } else {
                          Fluttertoast.showToast(msg: 'invalid Credential');
                          btStatus = false;
                        }
                      }).onError((error, stackTrace) {
                        btStatus = false;
                        print(error);
                      });
                    } else if (btStatus) {
                    } else {
                      Fluttertoast.showToast(msg: 'Unexpected Error');
                      btStatus = false;
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF2F1500),
                    ),
                    child: Center(
                        child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    )),
                  ),
                ),
              ),
              //not a member? register now

              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Are you forgottan password? ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    'reset now!',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
