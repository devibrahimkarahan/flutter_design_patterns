import 'package:flutter/material.dart' show Widget;
import 'package:flutter_design_patterns/memento/page_memento.dart';

final List<DesignPattern> patternList = [
  DesignPattern("Memento", PageMemento()),
];

class DesignPattern {
  final String name;
  final Widget page;

  DesignPattern(this.name, this.page);
}
