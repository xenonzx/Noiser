import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noiser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SoundsPage(),
    );
  }
}

class SoundsPage extends StatefulWidget {
  @override
  _SoundsPageState createState() => _SoundsPageState();
}

class _SoundsPageState extends State<SoundsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noiser"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
