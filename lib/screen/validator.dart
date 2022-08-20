import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_scan/Components/user_card.dart';

class validator extends StatefulWidget {
  const validator({Key? key}) : super(key: key);

  @override
  State<validator> createState() => _validatorState();
}

class _validatorState extends State<validator> {
  List user = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      color: Color.fromARGB(255, 245, 245, 245),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 1,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_sharp),
                    Text('    VALIDATOR PANEL',
                        style: GoogleFonts.secularOne(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    Expanded(
                        child: IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(Icons.add),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return Container(
                                child: ListView(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Name',
                                            border: InputBorder.none,
                                            hintText: 'Enter user name',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Department',
                                            border: InputBorder.none,
                                            hintText: 'Enter user department',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                            border: InputBorder.none,
                                            hintText: 'Enter user email',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Password',
                                            border: InputBorder.none,
                                            hintText: 'Enter user password',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ))
                  ],
                ),
              )),
          Positioned(
              top: 70,
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height - 70,
              child: ListView(
                children: [
                  userCard(
                    name: 'Sabarinath',
                    email: 'Sabarinath5604@gmail.com',
                    pass: 'Sab**********',
                    id: '123455',
                    type: 'AD',
                    dep: 'Computer Science',
                  ),
                  userCard(
                    name: 'Sabarinath',
                    email: 'Sabarinath5604@gmail.com',
                    pass: 'Sab**********',
                    id: '123455',
                    type: 'VD',
                    dep: 'Computer Science',
                  ),
                  userCard(
                    name: 'Sabarinath',
                    email: 'Sabarinath5604@gmail.com',
                    pass: 'Sab**********',
                    id: '123455',
                    type: 'VD',
                    dep: 'Computer Science',
                  ),
                  userCard(
                    name: 'Sabarinath',
                    email: 'Sabarinath5604@gmail.com',
                    pass: 'Sab**********',
                    id: '123455',
                    type: 'AD',
                    dep: 'Computer Science',
                  )
                ],
              ))
        ],
      ),
    )));
  }
}
