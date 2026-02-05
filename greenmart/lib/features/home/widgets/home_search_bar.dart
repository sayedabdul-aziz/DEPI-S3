import 'package:flutter/material.dart';
import 'package:greenmart/core/widgets/custom_text_field.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: CustomTextField(
        hint: 'Search Store',
        enabled: false,
        prefixIcon: Icon(Icons.search_rounded),
        onTap: () {},
      ),
    );
  }
}
