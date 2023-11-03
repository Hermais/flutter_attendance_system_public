import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QR Scanned!',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyQRNavigator(
//        toLaunch: Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/')),
//     );
//   }
// }

class MyQRNavigator extends StatefulWidget {
  const MyQRNavigator({super.key, required this.toLaunch});
  final Uri toLaunch;
  //final Uri toLaunch =
  //     Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');

  final String title = 'QR Scanned!';

  @override
  State<MyQRNavigator> createState() => _MyQRNavigatorState();
}


class _MyQRNavigatorState extends State<MyQRNavigator> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.platformDefault)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _launched = _launchInBrowser(widget.toLaunch);
                      }),
                      child: const Text('Launch in browser'),
                    ),
                    const Padding(padding: EdgeInsets.all(16.0)),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _launched = _launchInBrowserView(widget.toLaunch);
                      }),
                      child: const Text('Launch in app'),
                    ),
                    FutureBuilder<void>(future: _launched, builder: _launchStatus),
                  ])
            ]));
  }
}
