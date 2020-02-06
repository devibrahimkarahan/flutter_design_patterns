import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/memento/memento_extension.dart';

import 'generic_care_taker.dart';
import 'post.dart';

class CoklyStateKaydetme extends StatefulWidget {
  @override
  _CoklyStateKaydetmeState createState() => _CoklyStateKaydetmeState();
}

class _CoklyStateKaydetmeState extends State<CoklyStateKaydetme> {
  final GenericCareTaker<Post> postManager = GenericCareTaker<Post>();
  final Post post = Post("", "");
  final TextEditingController controllerAuthor = TextEditingController();
  final TextEditingController controllerBody = TextEditingController();

  @override
  void initState() {
    super.initState();
    save();
    controllerAuthor.addListener(() {
      post.author = controllerAuthor.text;
    });
    controllerBody.addListener(() {
      post.body = controllerBody.text;
    });
  }

  void save() {
    postManager.listMemento.add(post.save());
  }

  void restore() {
    if (postManager.listMemento.isEmpty) return;
    post.restore(postManager.listMemento.removeLast());
    controllerAuthor.setTextAndSelection(post.author);
    controllerBody.setTextAndSelection(post.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Çoklu state kaydetme"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: controllerAuthor,
                decoration: InputDecoration(hintText: "Yazar"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: controllerBody,
                decoration: InputDecoration(hintText: "İçerik"),
              ),
            ),
            const SizedBox(height: 12),
            RaisedButton(
              onPressed: save,
              child: Text("Kaydet"),
            ),
            RaisedButton(
              onPressed: restore,
              child: Text("Kaydedilene geri dön"),
            ),
          ],
        ),
      ),
    );
  }
}
