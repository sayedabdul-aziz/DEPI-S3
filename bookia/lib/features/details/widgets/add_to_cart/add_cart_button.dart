import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/details/widgets/add_to_cart/cubit/add_to_cart_cubit.dart';
import 'package:bookia/features/details/widgets/add_to_cart/cubit/add_to_cart_state.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCartButton extends StatelessWidget {
  final Product book;
  const AddCartButton({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartCubit(),
      child: BlocConsumer<AddToCartCubit, AddToCartState>(
        listener: (context, state) {
          if (state is AddToCartSuccessState) {
            pop(context);
            showMyDialog(context, state.message, DialogType.success);
          } else if (state is AddToCartErrorState) {
            pop(context);
            showMyDialog(context, state.error);
          } else if (state is AddToCartLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          return MainButton(
            minWidth: 200,
            bgColor: AppColors.darkColor,
            text: 'Add to cart',
            onPressed: () {
              context.read<AddToCartCubit>().addToCart(book.id ?? 0);
            },
          );
        },
      ),
    );
  }
}


// label or can remove for cart or update quantity ==> Caching
// add to cart => normal button 