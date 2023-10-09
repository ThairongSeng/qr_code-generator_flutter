import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:barcode_widget/barcode_widget.dart';

class QrCodeGenerator extends StatefulWidget {
  const QrCodeGenerator({super.key});

  @override
  State<QrCodeGenerator> createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  var txt_qr_code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  txt_qr_code = text; // Update txt_qr_code with the new text value
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
          const SizedBox(height: 10,),


          Stack(
            alignment: Alignment.center,
            children: [
              BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                ),
                data: txt_qr_code,
                width: 250,
                height: 250,
              ),
              Container(
                color: Colors.white,
                width: 50,
                height: 50,
                child: Image.network(
                    'https://istad.co/resources/img/CSTAD_120.png'
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Center(
            child: QrImageView(
              data: txt_qr_code,
              version: 5,
              embeddedImage: const NetworkImage('https://istad.co/resources/img/CSTAD_120.png'),
              embeddedImageStyle: const QrEmbeddedImageStyle(
                size: Size(50, 50),
              ),
              size: 250,
              gapless: false,
              errorStateBuilder: (cxt, err) {
                return const Center(
                  child: Text(
                    'Uh oh! Something went wrong...',
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
