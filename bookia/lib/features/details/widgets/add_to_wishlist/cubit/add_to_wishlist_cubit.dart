import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/details/widgets/add_to_wishlist/cubit/add_to_wishlist_state.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  WishlistActionCubit() : super(WishlistActionInitial());

  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionLoading());
    var response = await WishListRepo.addToWishlist(productId);
    if (response != null) {
      emit(WishlistActionSuccess(response.message ?? ""));
    } else {
      emit(WishlistActionError('Failed to add to wishlist'));
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistActionLoading());
    var response = await WishListRepo.removeFromWishlist(productId);
    if (response != null) {
      emit(WishlistActionSuccess(response.message ?? ""));
    } else {
      emit(WishlistActionError('Failed to remove from wishlist'));
    }
  }

  bool isProductInWishlist(int productId) {
    return SharedPref.getWishlistIds().contains(productId.toString());
  }
}
