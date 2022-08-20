import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_scan/screen/home.dart';
import 'package:library_scan/screen/primary.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passvis = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

              const SizedBox(
                height: 40.0,
              ),

              //email text field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => primary())));
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
