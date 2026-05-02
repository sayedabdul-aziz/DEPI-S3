import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/details/widgets/add_to_cart/cubit/add_to_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitialState());

  Future<void> addToCart(int productId) async {
    emit(AddToCartLoadingState());
    var response = await CartRepo.addToCart(productId);
    if (response != null) {
      emit(AddToCartSuccessState(response.message ?? ""));
    } else {
      emit(AddToCartErrorState("Failed to add to cart"));
    }
  }
}
