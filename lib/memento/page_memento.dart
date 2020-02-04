import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/memento/tek_state_kaydetme/tek_state_kaydetme.dart';

extension TextControllerSetTextAndSelection on TextEditingController {
  void setTextAndSelection(String text, [int selectionOffset]) {
    selectionOffset ??= text.length;
    this.text = text;
    this.selection = TextSelection.collapsed(offset: selectionOffset);
  }
}

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
          ],
        ),
      ),
    );
  }
}
