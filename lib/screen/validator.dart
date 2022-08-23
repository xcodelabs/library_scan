import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_scan/Components/user_card.dart';
import 'package:searchfield/searchfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

class validator extends StatefulWidget {
  const validator({Key? key}) : super(key: key);

  @override
  State<validator> createState() => _validatorState();
}

class _validatorState extends State<validator> {
  List user = [];
  List id = [];
  DatabaseReference db = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  getuser() {
    db.child('USER').onValue.listen((event) {
      setState(() {
        user = [];
      });

      setState(() {
        for (var sn in event.snapshot.children) {
          user.add(userCard(
              name: sn.child('NAME').value.toString(),
              type: sn.child('TYPE').value.toString(),
              dep: sn.child('DEP').value.toString(),
              email: sn.child('EMAIL').value.toString(),
              pass: sn.child('PASSWORD').value.toString(),
              id: sn.key.toString()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: MediaQuery.of(context).viewInsets,
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
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back_sharp)),
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
                          createUser();
                        },
                      ))
                    ],
                  ),
                )),
            Positioned(
                top: 70,
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height - 120,
                child: ListView.builder(
                    itemCount: user.length,
                    itemBuilder: ((context, index) {
                      return user[index];
                    })))
          ],
        ),
      )),
    ));
  }

  createUser() {
    TextEditingController name = TextEditingController(),
        email = TextEditingController(),
        Department = TextEditingController(),
        password = TextEditingController();
    bool admin = false;
    List list = [
      'Computer Science',
      'Mechanical',
      'Civil',
      'Electronics and Communication',
      'Electrical and Electronics'
    ];

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: StatefulBuilder(builder: ((context, state) {
                return SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    height: 400,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Create New User',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 120),
                            height: 3,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.blueGrey)),
                        Container(
                          width: 200,
                          //   height: 60,
                          margin: EdgeInsets.only(
                              left: 30, right: 30, bottom: 4, top: 20),
                          color: Colors.white,
                          child: TextField(
                              controller: name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name',
                              )),
                        ),
                        Container(
                          width: 200,
                          //  height: 60,
                          margin: EdgeInsets.only(
                              left: 30, right: 30, bottom: 4, top: 4),
                          color: Colors.white,
                          child: SearchField(
                              controller: Department,
                              suggestions: list
                                  .map((e) => SearchFieldListItem(e))
                                  .toList(),
                              searchInputDecoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Department',
                              )),
                        ),
                        Container(
                          width: 200,
                          //  height: 60,
                          margin: EdgeInsets.only(
                              left: 30, right: 30, bottom: 4, top: 4),
                          color: Colors.white,
                          child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                              )),
                        ),
                        Container(
                          width: 200,
                          //  height: 60,
                          margin: EdgeInsets.only(
                              left: 30, right: 30, bottom: 4, top: 4),
                          color: Colors.white,
                          child: TextField(
                              controller: password,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                              )),
                        ),
                        /*   Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Checkbox(
                              value: admin,
                              onChanged: (value) {
                                setState() {
                                  if (admin) {
                                    admin = false;
                                  } else {
                                    admin = true;
                                  }
                                }
                              },
                            ),
                            Text('To make as Admin')
                          ],
                        ),*/
                        Container(
                          margin: EdgeInsets.only(
                              right: 100, left: 100, bottom: 10, top: 5),
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                if (name.text == '' &&
                                    email.text == '' &&
                                    password.text == '' &&
                                    Department.text == '') {
                                  Fluttertoast.showToast(
                                      msg: 'Please fill the box');
                                } else {
                                  db.child('USER').push().update({
                                    'NAME': name.text.trim(),
                                    'EMAIL': email.text.trim(),
                                    'PASSWORD': password.text.trim(),
                                    'DEP': Department.text.trim(),
                                    'TYPE': 'VD'
                                  }).whenComplete(() {
                                    Fluttertoast.showToast(
                                        msg: 'New user is created');
                                    user.clear();
                                  });
                                  Navigator.pop(context);
                                }
                              },
                              child: Text('Create new user')),
                        ),
                      ],
                    ),
                  ),
                );
              })));
        });
  }
}
