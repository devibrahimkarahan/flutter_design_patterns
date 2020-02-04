import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_pattern.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageHome(),
    );
  }
}

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  void patternTapped(DesignPattern pattern) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => pattern.page,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasarım Desenleri"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: patternList.map<Widget>((f) {
            return RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () => patternTapped(f),
              child: Text(f.name, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
