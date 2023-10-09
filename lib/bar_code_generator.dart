import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarCode extends StatefulWidget {
  const BarCode({super.key});

  @override
  State<BarCode> createState() => _BarCodeState();
}

class _BarCodeState extends State<BarCode> {
  var txt_bar_code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  txt_bar_code =
                      text; // Update txt_qr_code with the new text value
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter text',
                labelStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.text_fields),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BarcodeWidget(
                    barcode: Barcode.code128(escapes: true),
                    data: txt_bar_code,
                    height: 160,
                    drawText: false,
                  ),
                ),
              ))

          //view look like qr code

          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     BarcodeWidget(
          //       barcode: Barcode.qrCode(
          //         errorCorrectLevel: BarcodeQRCorrectionLevel.high,
          //       ),
          //       data: txt_bar_code,
          //       width: 200,
          //       height: 200,
          //     ),
          //     Container(
          //       color: Colors.white,
          //       width: 60,
          //       height: 60,
          //       child: const FlutterLogo(),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
