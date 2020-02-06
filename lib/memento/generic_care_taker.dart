import 'package:flutter_design_patterns/memento/generic_memento.dart';

class GenericCareTaker<T> {
  GenericMemento<T> memento;

  List<GenericMemento<T>> listMemento = List();
}
