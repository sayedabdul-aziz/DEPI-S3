class CheckoutState {}

class CheckoutInitialState extends CheckoutState {}

class CheckoutLoadingState extends CheckoutState {}

class GetGovernoratesSuccessState extends CheckoutState {}

class CheckoutSuccessState extends CheckoutState {}

class CheckoutErrorState extends CheckoutState {
  final String message;
  CheckoutErrorState(this.message);
}
