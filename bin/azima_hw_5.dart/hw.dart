import 'book.dart';
import 'lib.dart';
void main(){
Book book1 = Book('Harry Potter', 'J.K. Rowling');
Book book2 = Book.withRaiting('Sherlock Holmes', 'Arthur Conan Doyle', 9.2);
Book book3 = Book('The Hobbit', 'J.R.R. Tolkien');
book3.setRaiting(8.8);

Library cityLib = Library('City Library');
cityLib.addBook(book1);
cityLib.addBook(book2);
cityLib.addBook(book3);
cityLib.showBooks();
print('Total books in the library: ${cityLib.totalBooks}');

}