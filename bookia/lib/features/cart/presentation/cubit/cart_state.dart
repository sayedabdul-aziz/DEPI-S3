class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {}

class CartErrorState extends CartState {
  final String message;
  CartErrorState(this.message);
}

class CheckoutLoadingState extends CartState {}

class CheckoutSuccessState extends CartState {}

class GovernoratesLoadingState extends CartState {}

class GovernoratesSuccessState extends CartState {}

class GovernoratesErrorState extends CartState {
  final String message;
  GovernoratesErrorState(this.message);
}
