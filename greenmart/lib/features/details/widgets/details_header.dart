import 'package:flutter/material.dart';
import 'package:greenmart/features/details/page/product_details_screen.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key, required this.widget});

  final ProductDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffF2F3F2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 100),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Hero(
                tag: widget.model.tag ?? '',
                child: Image.network(widget.model.image ?? ''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
