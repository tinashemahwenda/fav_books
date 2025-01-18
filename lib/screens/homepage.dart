import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/books.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Book> _books = [
    Book(id: '1', title: 'Book 1', author: 'Author 1'),
    Book(id: '2', title: 'Book 2', author: 'Author 2'),
    Book(id: '3', title: 'Book 3', author: 'Author 3'),
  ];
  List<String> _favoriteBooks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteBooks = prefs.getStringList('favorites') ?? [];
    });
  }

  Future<void> _toggleFavorite(String bookId) async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      if (_favoriteBooks.contains(bookId)) {
        _favoriteBooks.remove(bookId);
      } else {
        _favoriteBooks.add(bookId);
      }
    });
    await prefs.setStringList('favourites', _favoriteBooks);
  }

  bool _isFavorite(String bookId) {
    return _favoriteBooks.contains(bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: ,
        itemBuilder: itemBuilder) 
    );
  }
}
