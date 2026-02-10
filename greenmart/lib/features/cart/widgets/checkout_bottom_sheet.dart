import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/text_styles.dart';
import 'package:greenmart/core/widgets/main_button.dart';

Future<dynamic> showCheckoutBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.backgroundColor,
    // isDismissible: false,
    // enableDrag: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return CheckoutBottomSheet();
    },
  );
}

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Checkout', style: TextStyles.title),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          const Divider(height: 1),
          const SizedBox(height: 20),
          ListTile(
            title: Text('Payment Method', style: TextStyles.body),
            trailing: Icon(Icons.chevron_right, color: AppColors.primaryColor),
          ),
          const Divider(height: 20),
          ListTile(
            title: Text('Delivery Address', style: TextStyles.body),
            trailing: Icon(Icons.chevron_right, color: AppColors.primaryColor),
          ),
          ListTile(
            title: Text('Payment Method', style: TextStyles.body),
            trailing: Icon(Icons.chevron_right, color: AppColors.primaryColor),
          ),
          const Divider(height: 20),
          ListTile(
            title: Text('Delivery Address', style: TextStyles.body),
            trailing: Icon(Icons.chevron_right, color: AppColors.primaryColor),
          ),
          ListTile(
            title: Text('Payment Method', style: TextStyles.body),
            trailing: Icon(Icons.chevron_right, color: AppColors.primaryColor),
          ),
          const Divider(height: 20),
          ListTile(
            title: Text('Delivery Address', style: TextStyles.body),
            trailing: Icon(Icons.chevron_right, color: AppColors.primaryColor),
          ),
          const SizedBox(height: 20),
          MainButton(text: 'Checkout', onPressed: () {}),
        ],
      ),
    );
  }
}
