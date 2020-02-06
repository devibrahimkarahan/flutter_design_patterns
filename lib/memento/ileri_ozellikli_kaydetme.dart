import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/memento/memento_extension.dart';

import 'generic_care_taker.dart';
import 'post.dart';

class IleriOzellikliKaydetme extends StatefulWidget {
  @override
  _IleriOzellikliKaydetmeState createState() => _IleriOzellikliKaydetmeState();
}

class _IleriOzellikliKaydetmeState extends State<IleriOzellikliKaydetme> {
  final GenericCareTaker<Post> postManager = GenericCareTaker<Post>();
  final Post post = Post("", "");
  final TextEditingController controllerAuthor = TextEditingController();
  final TextEditingController controllerBody = TextEditingController();
  int stepIndex;

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
    setState(() {});
  }

  void prev() {
    if (postManager.listMemento.isEmpty) return;
    if (stepIndex == null) stepIndex = postManager.listMemento.length;
    if (stepIndex <= 0) return;
    post.restore(postManager.listMemento.elementAt(--stepIndex));
    controllerAuthor.setTextAndSelection(post.author);
    controllerBody.setTextAndSelection(post.body);
    setState(() {});
  }

  void next() {
    if (postManager.listMemento.isEmpty) return;
    if (stepIndex == null) return;
    if (stepIndex == postManager.listMemento.length - 1) return;
    post.restore(postManager.listMemento.elementAt(++stepIndex));
    controllerAuthor.setTextAndSelection(post.author);
    controllerBody.setTextAndSelection(post.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İleri özellikli kaydetme"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: prev,
                  child: Text("Geri"),
                ),
                RaisedButton(
                  onPressed: next,
                  child: Text("İleri"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
