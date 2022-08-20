import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String _scanBarcode = 'Unknown';
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      TextEditingController tx = TextEditingController();
      tx.text = _scanBarcode;
      final defaultPinTheme = PinTheme(
        width: 60,
        height: 64,
        textStyle: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
        decoration: BoxDecoration(color: Color.fromRGBO(159, 132, 193, 0.8)),
      );
      final focusNode = FocusNode();
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              height: 260,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 10,
                    child: Text('Book Code Scanned\nSucessfully',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.varelaRound(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2F1500),
                        )),
                  ),
                  Positioned(
                    top: 120,
                    child: SizedBox(
                      width: 300,
                      height: 30,
                      child: Pinput(
                        controller: tx,
                        length: 8,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 70,
                      child: Text(
                        'Please verify the scanned code \ncorrect with book code ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      )),
                  Positioned(
                      top: 180,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: 200,
                                height: 60,
                                child: Image.asset('asset/ok.png')),
                          ),
                          Container(
                              width: 200,
                              height: 60,
                              child: Image.asset('asset/cancel.png'))
                        ],
                      ))
                ],
              ),
            );
          });
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 80,
              child: Text('Scan Book Code',
                  style: GoogleFonts.roboto(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2F1500),
                  )),
            ),
            Positioned(
              top: 110,
              child: SizedBox(
                width: 300,
                height: 60,
                child: Text(
                    textAlign: TextAlign.center,
                    'Place the book code inside frame to scan please avoid shake to get result quickly',
                    style: GoogleFonts.roboto(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 66, 66, 66),
                    )),
              ),
            ),
            Positioned(
                child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('asset/scan.png'))),
            Positioned(
              top: 600,
              left: 60,
              right: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: InkWell(
                  onTap: () {
                    scanQR();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), //color of shadow
                          spreadRadius: 2, //spread radius
                          blurRadius: 4, // blur radius
                          offset: Offset(0, 5), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 225, 100, 55),
                    ),
                    child: Center(
                        child: Text(
                      'Click to Scan',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
