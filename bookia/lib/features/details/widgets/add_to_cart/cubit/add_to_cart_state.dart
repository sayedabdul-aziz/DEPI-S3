class AddToCartState {}

class AddToCartInitialState extends AddToCartState {}

class AddToCartLoadingState extends AddToCartState {}

class AddToCartSuccessState extends AddToCartState {
  final String message;
  AddToCartSuccessState(this.message);
}

class AddToCartErrorState extends AddToCartState {
  final String error;
  AddToCartErrorState(this.error);
}
