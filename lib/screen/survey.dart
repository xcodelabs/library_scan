import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_scan/Components/survey_card.dart';
import 'package:searchfield/searchfield.dart';

class survey extends StatefulWidget {
  const survey({Key? key}) : super(key: key);

  @override
  State<survey> createState() => _surveyState();
}

class _surveyState extends State<survey> {
  List survey = [];
  DatabaseReference db = FirebaseDatabase.instance.ref();
  getsurvey() {
    db.child('SURVEY').onValue.listen((event) {
      setState(() {
        survey = [];
      });
      setState(() {
        for (var id in event.snapshot.children) {
          survey.add(surveyCard(
              name: id.child('NAME').value.toString(),
              dt: id.child('TIME').value.toString(),
              type: id.child('STATUS').value.toString(),
              id: id.key.toString()));
        }
        survey.reversed;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsurvey();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
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
                  Text('    Survey Panel',
                      style: GoogleFonts.secularOne(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  Expanded(
                      child: IconButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.add),
                    onPressed: () {
                      createSurvey();
                    },
                  ))
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 90,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [for (int i = 0; i < survey.length; i++) survey[i]],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  createSurvey() {
    TextEditingController name = TextEditingController(),
        date = TextEditingController(),
        status = TextEditingController();
    List list = ['ACTIVE', 'CLOSE'];

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
                              controller: status,
                              suggestions: list
                                  .map((e) => SearchFieldListItem(e))
                                  .toList(),
                              searchInputDecoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'STATUS',
                              )),
                        ),
                        Container(
                          width: 200,
                          //  height: 60,
                          margin: EdgeInsets.only(
                              left: 30, right: 30, bottom: 4, top: 4),
                          color: Colors.white,
                          child: TextField(
                              controller: date,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'DATE',
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 100, left: 100, bottom: 10, top: 5),
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                if (name.text == '' &&
                                    date.text == '' &&
                                    status.text == '') {
                                  Fluttertoast.showToast(
                                      msg: 'Please fill the box');
                                } else {
                                  db.child('SURVEY').push().update({
                                    'NAME': name.text.trim(),
                                    'TIME': date.text.trim(),
                                    'STATUS': status.text.trim(),
                                  }).whenComplete(() {
                                    Fluttertoast.showToast(
                                        msg: 'New survey is created');
                                    //      survey.clear();
                                  });
                                  Navigator.pop(context);
                                }
                              },
                              child: Text('Create new survey')),
                        ),
                      ],
                    ),
                  ),
                );
              })));
        });
  }
}
