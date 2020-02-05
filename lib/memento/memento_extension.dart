import 'package:flutter/material.dart';

extension TextControllerSetTextAndSelection on TextEditingController {
  void setTextAndSelection(String text, [int selectionOffset]) {
    selectionOffset ??= text.length;
    this.text = text;
    this.selection = TextSelection.collapsed(offset: selectionOffset);
  }
}
