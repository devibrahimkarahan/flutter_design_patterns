import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/memento/coklu_state_kaydetme.dart';
import 'package:flutter_design_patterns/memento/ileri_ozellikli_kaydetme.dart';
import 'package:flutter_design_patterns/memento/tek_state_kaydetme.dart';

class PageMemento extends StatefulWidget {
  @override
  _PageMementoState createState() => _PageMementoState();
}

class _PageMementoState extends State<PageMemento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memento"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => TekStateKaydetme(),
                ));
              },
              child: Text("Tek state kaydetme"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => CoklyStateKaydetme(),
                ));
              },
              child: Text("Çoklu state kaydetme"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => IleriOzellikliKaydetme(),
                ));
              },
              child: Text("İleri özellikli kaydetme"),
            ),
          ],
        ),
      ),
    );
  }
}
