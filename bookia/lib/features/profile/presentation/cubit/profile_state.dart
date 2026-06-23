class ProfileState {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileImagePickedState extends ProfileState {}

class ProfileSuccessState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String message;
  const ProfileErrorState(this.message);
}
