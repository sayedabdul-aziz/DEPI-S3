class WishlistActionState {}

class WishlistActionInitial extends WishlistActionState {}

class WishlistActionLoading extends WishlistActionState {}

class WishlistActionSuccess extends WishlistActionState {
  final String message;
  WishlistActionSuccess(this.message);
}

class WishlistActionError extends WishlistActionState {
  final String error;
  WishlistActionError(this.error);
}
