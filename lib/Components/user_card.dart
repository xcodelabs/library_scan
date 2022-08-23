import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class userCard extends StatefulWidget {
  String name, type, dep, email, pass, id;
  userCard(
      {Key? key,
      required this.name,
      required this.type,
      required this.dep,
      required this.email,
      required this.pass,
      required this.id})
      : super(key: key);

  @override
  State<userCard> createState() => _userCardState(
        name: name,
        pass: pass,
        type: type,
        dep: dep,
        email: email,
        id: id,
      );
}

class _userCardState extends State<userCard> {
  String name, type, dep, email, pass, id;
  _userCardState(
      {required this.name,
      required this.type,
      required this.dep,
      required this.email,
      required this.pass,
      required this.id});

  DatabaseReference db = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      width: MediaQuery.of(context).size.width - 30,
      height: 130,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Positioned(
              width: 50,
              height: 5,
              left: 40,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                    color:
                        (type == 'AD') ? Colors.lightGreen : Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              )),
          Positioned(
              top: 15,
              left: 40,
              child: Text((type == 'AD') ? 'ADMIN' : 'VALIDATOR',
                  //       textAlign: TextAlign.center,
                  style: TextStyle(
                      color:
                          (type == 'AD') ? Colors.lightGreen : Colors.lightBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.w700))),
          Positioned(
              top: 38,
              left: 20,
              child: Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )),
          Positioned(bottom: 42, left: 20, child: Text('Department   :  $dep')),
          Positioned(
              bottom: 26,
              left: 20,
              child: Text('Email              :  $email')),
          Positioned(
              bottom: 9, left: 20, child: Text('Password      :  $pass')),
          Positioned(
              right: 20,
              top: 1,
              child: Row(
                children: [
                  if (type != 'AD')
                    InkWell(
                      onTap: () {
                        if (type != 'AD') {
                          setState(() {
                            type = 'AD';
                          });
                          db.child('USER').child(id).child('TYPE').set('AD');
                        }
                      },
                      child: Icon(Icons.swap_vert),
                    ),
                  InkWell(
                      onTap: () {
                        db.child('USER').child(id).remove();
                      },
                      child: Icon(Icons.delete)),
                ],
              ))
        ],
      ),
    );
  }
}
