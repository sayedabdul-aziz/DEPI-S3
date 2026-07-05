import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/extentions/image_uploader.dart';
import 'package:se7ety/core/services/firebase/firestore_provider.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/update_doctor/cubit/update_doctor_profile_state.dart';

class UpdateDoctorProfileCubit extends Cubit<UpdateDoctorProfileState> {
  UpdateDoctorProfileCubit() : super(UpdateDoctorProfileInitialState());

  final formKey = GlobalKey<FormState>();

  final bioController = TextEditingController();
  final addressController = TextEditingController();
  final openHourController = TextEditingController();
  final closeHourController = TextEditingController();
  final phone1Controller = TextEditingController();
  final phone2Controller = TextEditingController();

  String? specialization;
  File imageFile = File('');

  Future<void> updateProfile() async {
    emit(UpdateDoctorProfileLoadingState());
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final imageUrl = await uploadImageToCloudinary(imageFile) ?? '';

      final doctor = DoctorModel(
        uid: uid,
        image: imageUrl,
        specialization: specialization,
        bio: bioController.text,
        address: addressController.text,
        openHour: openHourController.text,
        closeHour: closeHourController.text,
        phone1: phone1Controller.text,
        phone2: phone2Controller.text.isNotEmpty ? phone2Controller.text : null,
      );

      await FirestoreServices.updateDoctor(doctor);
      emit(UpdateDoctorProfileSuccessState());
    } catch (e) {
      emit(UpdateDoctorProfileErrorState(message: 'حدث خطأ ما'));
    }
  }

  @override
  Future<void> close() {
    bioController.dispose();
    addressController.dispose();
    openHourController.dispose();
    closeHourController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    return super.close();
  }
}
