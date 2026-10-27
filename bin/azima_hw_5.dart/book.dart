class Book {
  String _title;
  String _author;
  double _raiting;

Book(this._title, this._author) : this._raiting = 0.0;

  String get title => _title;
  String get author => _author;
  double get raiting => _raiting;

  void setRaiting(double raiting) {
    if (raiting >= 0 && raiting <= 10) {
      _raiting = raiting;
    } else {
      print('Invalid raiting value. It should be between 0.0 and 10.');
    }
  }

  void displayInfo() {
    print('Title: $_title');
    print('Author: $_author');
    print('Raiting: $_raiting');
  }

  Book.withRaiting(this._title, this._author, this._raiting);

}