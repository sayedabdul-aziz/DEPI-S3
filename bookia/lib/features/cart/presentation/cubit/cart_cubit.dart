import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/features/checkout/data/models/governorate_response/datum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  String? total;
  List<CartItem> cartItems = [];
  List<Governorate> governorates = [];

  Future<void> getCart() async {
    emit(CartLoadingState());
    var data = await CartRepo.getCart();
    if (data != null) {
      total = data.data?.total.toString();
      cartItems = data.data?.cartItems ?? [];
      emit(CartLoadedState());
    } else {
      emit(CartErrorState('Something went Wrong'));
    }
  }

  Future<void> removeFromCart(int cartItemId) async {
    // OFFLINE FIRST => instant update ui without shimmer
    // get item that we need to remove
    // remove it from cart => instant
    // remove it from total => instant
    // update the ui => instant
    // send request to server => normal
    // if request failed => undo

    var item = cartItems.firstWhere((element) => element.itemId == cartItemId);
    cartItems.remove(item);
    if (total != null) {
      total = ((double.tryParse(total!) ?? 0.0) - (item.itemTotal ?? 0.0))
          .toStringAsFixed(2);
    }
    emit(CartLoadedState());
    var data = await CartRepo.removeFromCart(cartItemId);
    if (data != null) {
      total = data.data?.total.toString();
      cartItems = data.data?.cartItems ?? [];
      emit(CartLoadedState());
    } else {
      cartItems.add(item);
      if (total != null) {
        total = ((double.tryParse(total!) ?? 0.0) + (item.itemTotal ?? 0.0))
            .toStringAsFixed(2);
      }
      emit(CartErrorState('Something went Wrong'));
    }
  }

  Future<void> updateCart(int cartItemId, int quantity) async {
    // get item quantity and stock
    var item = cartItems.firstWhere((element) => element.itemId == cartItemId);
    // update quantity => instant
    int oldQuantity = item.itemQuantity ?? 0;
    int newQuantity = quantity;

    item.itemQuantity = newQuantity;

    // update total => instant
    double oldTotal = item.itemTotal ?? 0;
    double newTotal = quantity * (item.itemProductPriceAfterDiscount ?? 0.0);

    item.itemTotal = newTotal;

    // calculate new total
    if (total != null) {
      total = ((double.tryParse(total!) ?? 0.0) - oldTotal + newTotal)
          .toStringAsFixed(2);
    }

    emit(CartLoadedState());
    var data = await CartRepo.updateCart(cartItemId, quantity);
    if (data != null) {
      total = data.data?.total.toString();
      cartItems = data.data?.cartItems ?? [];
      emit(CartLoadedState());
    } else {
      // undo => refresh cart
      item.itemQuantity = oldQuantity;
      item.itemTotal = oldTotal;
      if (total != null) {
        total = ((double.tryParse(total!) ?? 0.0) + oldTotal - newTotal)
            .toStringAsFixed(2);
      }
      emit(CartErrorState('Something went Wrong'));
    }
  }

  Future<void> checkout() async {
    emit(CheckoutLoadingState());
    var isSuccess = await CartRepo.checkout();
    if (isSuccess) {
      emit(CheckoutSuccessState());
    } else {
      emit(CartErrorState('Something went Wrong'));
    }
  }
}
