import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_page_transition/PageCount.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // force landscape
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    // remove overlays, going fullscreen
    SystemChrome.setEnabledSystemUIOverlays([]);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 64.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff000000),
            ),
            bodyText1: TextStyle(
                fontSize: 24.0,
                fontStyle: FontStyle.italic,
                color: Color(0xff3333aa)),
          )),
      initialRoute: '/page-a',
      routes: {
        '/page-a': (context) => PageCount(
              counter: 0,
            )
      },
    );
  }
}
