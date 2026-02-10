import 'package:flutter/material.dart';
import 'package:greenmart/core/widgets/main_button.dart';
import 'package:greenmart/features/cart/widgets/cart_item_widget.dart';
import 'package:greenmart/features/cart/widgets/checkout_bottom_sheet.dart';
import 'package:greenmart/features/home/data/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: bestSellingProducts.length,
        itemBuilder: (context, index) {
          var item = bestSellingProducts[index];
          return CartItemWidget(item: item);
        },
        separatorBuilder: (context, index) => const Divider(height: 40),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: MainButton(
          text: 'Checkout',
          onPressed: () {
            showCheckoutBottomSheet(context);
          },
        ),
      ),
    );
  }
}
