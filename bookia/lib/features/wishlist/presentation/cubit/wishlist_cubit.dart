import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitialState());

  List<Product> wishlist = [];

  Future<void> getWishlist() async {
    emit(WishlistLoadingState());
    var response = await WishListRepo.getWishlist();
    if (response != null && response.data != null) {
      wishlist = response.data?.data ?? [];
      emit(WishlistSuccessState());
    } else {
      emit(WishlistErrorState(error: "Failed to load wishlist"));
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    // OFFLINE FIRST
    // get item that we need to remove
    var item = wishlist.firstWhere((element) => element.id == productId);
    // remove it from wishlist => instant
    wishlist.remove(item);
    // update the ui => instant
    emit(WishlistSuccessState());
    // send request to server => normal
    var response = await WishListRepo.removeFromWishlist(productId);
    // if request failed => undo
    if (response != null && response.data != null) {
      wishlist = response.data?.data ?? [];
      emit(WishlistSuccessState(message: response.message ?? ""));
    } else {
      wishlist.add(item);
      emit(WishlistErrorState(error: "Failed to update wishlist"));
    }
  }
}
