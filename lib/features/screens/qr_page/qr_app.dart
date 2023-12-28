import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/cubits/qr_scanner_cubit.dart';

class QRScannerWithScaffold extends StatelessWidget {
  final Function storeScanResult;
  final String? qrAppTitle;
  final Widget? appBarFlexibleSpace;

  const QRScannerWithScaffold(
      {super.key,
      required this.storeScanResult,
      this.qrAppTitle,
      this.appBarFlexibleSpace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appBarFlexibleSpace,
      ),
      body: QRScanner(
        storeScanResult: storeScanResult,
        qrAppTitle: qrAppTitle,
      ),
    );
  }
}

class QRScanner extends StatefulWidget {
  final Function storeScanResult;
  final String? qrAppTitle;
  final double margins = 30;

  const QRScanner({required this.storeScanResult, this.qrAppTitle, super.key});

  @override
  State<StatefulWidget> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<QrScannerCubit>(context),
      child: BlocListener<QrScannerCubit, QrScannerState>(
        listener: (context, state) {
          if(state is QrScannerIdle || state is QrScannerScanned) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Attendance marked successfully.')),
            );
            if(state is QrScannerScanned){
              controller!.pauseCamera();
            }
            else if(state is QrIdMismatch){
                controller!.resumeCamera();
            }
          }
          if(state is QrIdMismatch){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Lecture ID Mismatch. Attendance could not be marked.')),
            );
          }
        },
        child: Scaffold(
            body: Stack(alignment: Alignment.bottomCenter, children: [
          Column(
            children: <Widget>[
              Expanded(child: _buildQrView(context)),
            ],
          ),
          Container(
            height: 180,
            alignment: Alignment.bottomCenter,
            transformAlignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.margins),
                    topRight: Radius.circular(widget.margins))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(widget.margins),
                          bottomRight: Radius.circular(widget.margins)),
                      color: const Color.fromRGBO(245, 240, 235, 1),
                    ),
                    child: Text(
                      widget.qrAppTitle ?? "Scan a code",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Text(
                        'Scan result: ${result != null ? result!.code : ' '}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: FilledButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Theme.of(context).primaryColor),
                              ),
                              onPressed: () async {
                                await controller?.toggleFlash();
                                setState(() {});
                              },
                              child: FutureBuilder(
                                future: controller?.getFlashStatus(),
                                builder: (context, snapshot) {
                                  //return Text('Flash: ${snapshot.data}');
                                  return Icon((snapshot.data ?? false)
                                      ? Icons.flash_on
                                      : Icons.flash_off);
                                },
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: FilledButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Theme.of(context).primaryColor),
                              ),
                              onPressed: () async {
                                await controller?.flipCamera();
                                setState(() {});
                              },
                              child: FutureBuilder(
                                future: controller?.getCameraInfo(),
                                builder: (context, snapshot) {
                                  if (snapshot.data != null) {
                                    //return Text('Camera\'s facing ${describeEnum(snapshot.data!)}');
                                    return Icon((snapshot.data!.name == 'front'
                                        ? Icons.camera_rear
                                        : Icons.camera_front));
                                  } else {
                                    return const Text('loading');
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ])),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).primaryColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;


        print("\n\n\n\n\n\nSCAN RESULT ${result!.code}\n\n\n\n\n\n\n");
        widget.storeScanResult(result!.code ?? "NULL Error!");
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
