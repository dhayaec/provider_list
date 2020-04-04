import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_master/models/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    // debugPrint("${product.name}");
    return ListTile(
      title: Text(product.name),
      onTap: () {
        product.like();
      },
      trailing: Icon(
        Icons.favorite,
        color: product.isLiked ? Colors.red : Colors.grey,
      ),
    );
  }
}
