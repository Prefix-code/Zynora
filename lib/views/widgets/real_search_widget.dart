import 'package:flutter/material.dart';
import 'package:marketky/core/model/Product.dart';

class RealSearchWidget extends StatefulWidget {
  final List<Product> items; // yaha ab Product list aayegi
  RealSearchWidget({@required this.items});

  @override
  _RealSearchWidgetState createState() => _RealSearchWidgetState();
}

class _RealSearchWidgetState extends State<RealSearchWidget> {
  TextEditingController _controller = TextEditingController();
  List<Product> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items; // shuru me sab products dikhane ke liye
  }

  void _filterSearch(String query) {
    List<Product> results = [];
    if (query.isEmpty) {
      results = widget.items;
    } else {
      results = widget.items
          .where((item) =>
              item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔎 Search bar
        Container(
          height: 40,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: _controller,
            onChanged: _filterSearch,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Find a product...',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              icon: Icon(Icons.search, color: Colors.white),
            ),
          ),
        ),

        // 📋 Results list
        Expanded(
          child: ListView.builder(
            itemCount: _filteredItems.length,
            itemBuilder: (context, index) {
              final product = _filteredItems[index];
              return ListTile(
                title: Text(
                  product.name,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "₹${product.price}", // price bhi dikha do
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
