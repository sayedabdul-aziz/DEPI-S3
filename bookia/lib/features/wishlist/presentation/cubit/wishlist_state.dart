class WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final String? message;
  WishlistSuccessState({this.message});
}

class WishlistErrorState extends WishlistState {
  final String error;
  WishlistErrorState({required this.error});
}
