import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quilwriterfinal/Models/books.dart';
import 'package:quilwriterfinal/Models/database.dart';
import 'package:quilwriterfinal/Models/favourite.dart';
import 'package:quilwriterfinal/Models/user.dart';

class Presenter {
  Database _database = Database();

  Future<void> insertUser(
      String email, String fullname, String password, String userid) async {
    Users _newUser =
        Users(email: email, fullname: fullname, password: password);

    await _database.addUser(_newUser, userid);
  }

  Future<void> insertBooks(
      String bookname,
      String author,
      String authorid,
      String coverImage,
      String bookdescription,
      String bookcategory,
      context) async {
    Books _newBook = Books(
      bookname: bookname,
      author: author,
      authorid: authorid,
      coverImage: coverImage,
      bookdescription: bookdescription,
      bookcontent: "",
      bookcategory: bookcategory,
    );

    await _database.addBook(_newBook, context);
  }

  Future<void> updateBooks(
      String author,
      String authorid,
      String bookcontent,
      String bookname,
      String coverImage,
      String bookdescription,
      String bookcategory,
      String docid,
      context) async {
    Books _updateBook = Books(
        bookname: bookname,
        bookdescription: bookdescription,
        coverImage: coverImage,
        author: author,
        authorid: authorid,
        bookcontent: bookcontent,
        bookcategory: bookcategory);

    await _database.updateBook(_updateBook, docid, context);
  }

  Future<void> updateUser(String fullname, String email, String password,String docid) async {
    Users _updateBook = Users(
      fullname: fullname,
      email: email,
      password: password,
    );

    await _database.updateUser(_updateBook, docid);
  }

  Future<void>addFavourite(String bookid, String userid) async{
    Favourite fav=Favourite(
      bookid: bookid,
      userid: userid
    );


    await _database.favourite(fav);
  }

  Future<void> deleteBooks(String docid) async {
    await _database.deleteBook(docid);
  }
}
