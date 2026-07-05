class UpdateDoctorProfileState {}

class UpdateDoctorProfileInitialState extends UpdateDoctorProfileState {}

class UpdateDoctorProfileLoadingState extends UpdateDoctorProfileState {}

class UpdateDoctorProfileSuccessState extends UpdateDoctorProfileState {}

class UpdateDoctorProfileErrorState extends UpdateDoctorProfileState {
  final String message;
  UpdateDoctorProfileErrorState({required this.message});
}
