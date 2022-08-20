import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:library_scan/Components/user_card.dart';
import 'package:library_scan/screen/home.dart';
import 'package:library_scan/screen/validator.dart';

class primary extends StatefulWidget {
  primary({Key? key}) : super(key: key);

  @override
  State<primary> createState() => _primaryState();
}

class _primaryState extends State<primary> {
  List image = [
    'https://th.bing.com/th/id/OIP.Vpm_cy_r5EXPhUL3WSQjWgHaEZ?w=305&h=181&c=7&r=0&o=5&dpr=1.25&pid=1.7',
    'https://www.targetadmission.com/img/colleges/newc/28716-92268.jpg'
  ];
  BoxDecoration decoration = BoxDecoration(
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
        //you can set more BoxShadow() here
      ],
      borderRadius: BorderRadius.all(Radius.circular(20)));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Color(0xf5f5f5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Color(0xFFF9E5DE),
              child: Center(
                child: Text(
                  "CEMP Library",
                  style: GoogleFonts.secularOne(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2F1500),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              right: 10,
              left: 10,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width - 50,
                decoration: decoration,
                height: MediaQuery.of(context).size.width * 3 / 4,
                child: Swiper(
                  itemBuilder: (BuildContext context, imno) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      height: MediaQuery.of(context).size.width * 3 / 4,
                      child: Image.network(
                        image[imno],
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                  itemCount: 2,
                  loop: false,
                  pagination: const SwiperPagination(
                    margin: EdgeInsets.only(top: 2),
                    alignment: Alignment.topCenter,
                    builder: DotSwiperPaginationBuilder(
                        activeSize: 8,
                        size: 5,
                        activeColor: Colors.grey,
                        color: Color(0xff38547C)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 380,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => validator())));
                      },
                      child: Positioned(
                        left: 15,
                        child: Container(
                          width: 100,
                          height: 100,
                          alignment: Alignment.center,
                          decoration: decoration,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 80,
                                child: Image.network(
                                    'https://cdn3.iconfinder.com/data/icons/user-roles/64/users-06-512.png'),
                              ),
                              Text(
                                "Validator",
                                style: GoogleFonts.secularOne(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2F1500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 130,
                      child: Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        decoration: decoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 80,
                              child: Image.network(
                                  'https://www.clipartkey.com/mpngs/m/158-1580691_feedback-survey-icon-png.png'),
                            ),
                            Text(
                              "Edit Survey",
                              style: GoogleFonts.secularOne(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2F1500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 245,
                      child: Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        decoration: decoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 80,
                              child: Image.network(
                                  'https://thumbs.dreamstime.com/b/account-laptop-report-print-resume-white-line-icon-circle-background-vector-illustration-eps-abstract-template-145365159.jpg'),
                            ),
                            Text(
                              "Report",
                              style: GoogleFonts.secularOne(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2F1500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 500,
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) => home())));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 80,
                        child: Image.network(
                            'https://www.kindpng.com/picc/m/480-4802869_how-to-read-or-scan-qr-code-on.png'),
                      ),
                      Text(
                        "Validator",
                        style: GoogleFonts.secularOne(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2F1500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
