import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  int id;
  String name;
  bool isLiked;

  Product({
    @required this.id,
    @required this.name,
    this.isLiked = false,
  });

  like() {
    isLiked = !isLiked;
    notifyListeners();
  }
}

class Products extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetch() async {
    await Future.delayed(Duration(seconds: 1));
    _products = [
      Product(id: 1, name: 'Product One'),
      Product(id: 2, name: 'Product Two'),
      Product(id: 3, name: 'Product Three'),
      Product(id: 4, name: 'Product Four'),
      Product(id: 5, name: 'Product Five'),
      Product(id: 6, name: 'Product Six'),
    ];
    notifyListeners();
  }

  void add(Product p) {
    _products.add(p);
    notifyListeners();
  }

  void remove(Product p) {
    _products.remove((i) => i.id == p.id);
    notifyListeners();
  }
}
