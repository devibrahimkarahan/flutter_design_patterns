import 'package:flutter/material.dart';

abstract class IEncrypter {
  const IEncrypter();

  String encrypt(String value);

  String decrypt(String value);
}

class MD5Encrypter extends IEncrypter {
  const MD5Encrypter();

  @override
  String encrypt(String value) {
    return "MD5 $value";
  }

  @override
  String decrypt(String value) {
    return value.replaceFirst("MD5 ", "");
  }
}

class XYZEncrypter extends IEncrypter {
  const XYZEncrypter();

  @override
  String encrypt(String value) {
    return "XYZ $value";
  }

  @override
  String decrypt(String value) {
    return value.replaceFirst("XYZ ", "");
  }
}

class Encrypter {
  final IEncrypter _encrypter;

  const Encrypter(this._encrypter);

  String encrypt(String value) {
    return _encrypter.encrypt(value);
  }

  String decrypt(String value) {
    return _encrypter.decrypt(value);
  }
}

class PageStrategy extends StatefulWidget {
  @override
  _PageStrategyState createState() => _PageStrategyState();
}

class _PageStrategyState extends State<PageStrategy> {
  final md5Controller = TextEditingController();
  final xyzController = TextEditingController();
  final md5Encrypter = const MD5Encrypter();
  final xyzEncrypter = const XYZEncrypter();

  void encrypt() {
    setState(() {
      md5Controller.text = Encrypter(md5Encrypter).encrypt(
        md5Controller.text,
      );
      xyzController.text = Encrypter(xyzEncrypter).encrypt(
        xyzController.text,
      );
    });
  }

  void decrypt() {
    setState(() {
      md5Controller.text = Encrypter(md5Encrypter).decrypt(
        md5Controller.text,
      );
      xyzController.text = Encrypter(xyzEncrypter).decrypt(
        xyzController.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Strategy"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextFormField(
                controller: md5Controller,
                decoration: InputDecoration(hintText: "MD5"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextFormField(
                controller: xyzController,
                decoration: InputDecoration(hintText: "XYZ"),
              ),
            ),
            const SizedBox(height: 12),
            RaisedButton(
              onPressed: encrypt,
              child: Text("Encrypt"),
            ),
            RaisedButton(
              onPressed: decrypt,
              child: Text("Decrypt"),
            ),
          ],
        ),
      ),
    );
  }
}
