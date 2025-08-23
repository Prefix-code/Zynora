import 'package:flutter/material.dart';
import 'package:marketky/core/model/Product.dart';
import 'package:marketky/views/widgets/real_search_widget.dart';

class SearchPage extends StatelessWidget {
  final List<Product> products;

  SearchPage({@required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: RealSearchWidget(
          items: products, // yaha tumhari product list aa jayegi
        ),
      ),
    );
  }
}
