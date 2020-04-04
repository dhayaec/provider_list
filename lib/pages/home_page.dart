import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_master/models/product.dart';
import 'package:state_master/pages/base_view.dart';
import 'package:state_master/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<Products>(
      model: Products(),
      onModelReady: (model) => model.fetch(),
      builder: (_, model, child) {
        List<Product> products = model.products;
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: products.length == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: products.length,
                  itemBuilder: (_, i) {
                    return ChangeNotifierProvider.value(
                      value: products[i],
                      child: ProductItem(),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              model.add(
                Product(
                  id: model.products.length,
                  name: "Product ${model.products.length}",
                ),
              );
              _scrollController.jumpTo(
                _scrollController.position.maxScrollExtent,
              );
            },
          ),
        );
      },
    );
  }
}
