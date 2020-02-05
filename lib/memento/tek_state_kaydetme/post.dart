import 'generic_memento.dart';

class Post {
  String author;
  String body;

  Post(this.author, this.body);

  GenericMemento<Post> save() {
    return GenericMemento(Post(author, body));
  }

  void restore(GenericMemento<Post> memento) {
    this.author = memento.state.author;
    this.body = memento.state.body;
  }
}
