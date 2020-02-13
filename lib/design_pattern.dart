import 'package:flutter/material.dart' show Widget;
import 'package:flutter_design_patterns/memento/page_memento.dart';
import 'package:flutter_design_patterns/strategy/page_strategy.dart';

final List<DesignPattern> patternList = [
  DesignPattern("Memento", PageMemento()),
  DesignPattern("Strategy", PageStrategy()),
];

class DesignPattern {
  final String name;
  final Widget page;

  DesignPattern(this.name, this.page);
}
