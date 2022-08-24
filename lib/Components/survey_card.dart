import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class surveyCard extends StatefulWidget {
  String name, dt, type, id;
   surveyCard({Key? key, required this.name, required this.dt,required this.type, required this.id   }) : super(key: key);

  @override
  State<surveyCard> createState() => _surveyCardState(name: name ,dt: dt,type: type,id: id);
}

class _surveyCardState extends State<surveyCard> {
   String name, dt, type, id;
   _surveyCardState({required this.name,
      required this.dt,
      required this.type,
      required this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 180,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            width: 150,
            height: 150,
            top: 30,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 3, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                ])),
          ),
          Positioned(
              top: 75,
              child: Text(
                type,
                style: TextStyle(
                    color: (type == 'ACTIVE')?Colors.lightGreen:
                    Colors.redAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )),
          Positioned(
              top: 90,
              child: Text(
                dt,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              )),
          Positioned(
              width: 120,
              top: 110,
              height: 30,
              child: Text(
                name ,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
                softWrap: true,
              )),
          Positioned(
              width: 120,
              top: 145,
              height: 30,
              child: Text(
                'Survey ID\n$id',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
                softWrap: true,
              )),
          Positioned(
              top: 1,
              width: 80,
              height: 80,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: Image.asset('asset/book.png'),
              )),
        ],
      ),
    );
  }
}
