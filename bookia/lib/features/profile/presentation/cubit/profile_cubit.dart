import 'dart:io';

import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/data/models/edit_profile_params.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  File? imageFile;

  void initControllers() {
    final userInfo = SharedPref.getUserInfo();
    nameController.text = userInfo?.name ?? '';
    phoneController.text = userInfo?.phone ?? '';
    addressController.text = userInfo?.address ?? '';
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      emit(ProfileImagePickedState());
    }
  }

  Future<void> updateProfile() async {
    emit(ProfileLoadingState());
    var result = await ProfileRepo.updateProfile(
      EditProfileParams(
        name: nameController.text,
        phone: phoneController.text,
        address: addressController.text,
        image: imageFile,
      ),
    );

    if (result?.data != null) {
      SharedPref.saveUserInfo(result?.data);
      emit(ProfileSuccessState());
    } else {
      emit(ProfileErrorState(result?.message ?? 'Something went wrong'));
    }
  }
}
