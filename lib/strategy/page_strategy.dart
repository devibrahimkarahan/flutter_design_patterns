import 'package:flutter/material.dart';

abstract class IEncrypter {
  const IEncrypter();

  String encrypt(String value);

  String decrypt(String value);
}

class AESEncrypter extends IEncrypter {
  const AESEncrypter();

  @override
  String encrypt(String value) {
    return "AES $value";
  }

  @override
  String decrypt(String value) {
    return value.replaceFirst("AES ", "");
  }
}

class RSAEncrypter extends IEncrypter {
  const RSAEncrypter();

  @override
  String encrypt(String value) {
    return "RSA $value";
  }

  @override
  String decrypt(String value) {
    return value.replaceFirst("RSA ", "");
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
  final aesController = TextEditingController();
  final rsaController = TextEditingController();
  final aesEncrypter = const AESEncrypter();
  final rsaEncrypter = const RSAEncrypter();

  void encrypt() {
    setState(() {
      aesController.text = Encrypter(aesEncrypter).encrypt(
        aesController.text,
      );
      rsaController.text = Encrypter(rsaEncrypter).encrypt(
        rsaController.text,
      );
    });
  }

  void decrypt() {
    setState(() {
      aesController.text = Encrypter(aesEncrypter).decrypt(
        aesController.text,
      );
      rsaController.text = Encrypter(rsaEncrypter).decrypt(
        rsaController.text,
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
                controller: aesController,
                decoration: InputDecoration(hintText: "AES"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextFormField(
                controller: rsaController,
                decoration: InputDecoration(hintText: "RSA"),
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
