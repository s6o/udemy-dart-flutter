import 'package:flutter/material.dart';

void main() => runApp(RecepiesApp());

class RecepiesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recepies',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: _RecepiesScreen(title: 'Recepies'),
    );
  }
}

class _RecepiesScreen extends StatefulWidget {
  _RecepiesScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RecepiesState createState() => _RecepiesState();
}

class _RecepiesState extends State<_RecepiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Recepies Screen'),
      ),
    );
  }
}
