import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void launcWhatsApp({@required number, @required message}) async {
    String whatsappurl_isApp = "whatsapp://send?phone=$number&text=$message";
    String whatsappurl_isNotApp =
        "https://api.whatsapp.com/send/?phone=$number&text=$message";

    await canLaunch(whatsappurl_isApp)
        ? launch(whatsappurl_isApp)
        : launch(whatsappurl_isNotApp);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Message',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Send Message'),
        ),
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: OutlineButton(
                  child: Text('Send Message'),
                  onPressed: () {
                    launcWhatsApp(
                        number: '+905555555555',
                        message:
                            'Bu Adresten bana ulaşabilirsiniz. http://celalkutluer.com.tr/');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
