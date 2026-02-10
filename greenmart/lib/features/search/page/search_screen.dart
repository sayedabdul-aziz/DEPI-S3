import 'package:flutter/material.dart';
import 'package:greenmart/core/widgets/custom_text_field.dart';
import 'package:greenmart/features/home/data/product_model.dart';
import 'package:greenmart/features/search/widgets/filtered_products_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchKey = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: CustomTextField(
          hint: 'Search Store',
          prefixIcon: Icon(Icons.search_rounded),
          onChange: (value) {
            setState(() {
              searchKey = value;
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: FilteredProductsBuilder(products: getProductsByName(searchKey)),
      ),
    );
  }
}
