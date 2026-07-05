import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/services/firebase/firestore_provider.dart';
import 'package:se7ety/core/services/local/shared_pref.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/auth/data/models/patient_model.dart';
import 'package:se7ety/features/auth/data/models/user_model.dart';
import 'package:se7ety/features/auth/data/models/user_type_enum.dart';
import 'package:se7ety/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      var user = credential.user;

      UserTypeEnum userType = UserTypeEnum.fromValue(user?.photoURL ?? "");

      emit(AuthSuccessState(userType));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState(message: "المستخدم غير موجود"));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState(message: "كلمة المرور غير صحيحة"));
      } else {
        emit(AuthErrorState(message: "حدث خطأ ما"));
      }
    } catch (e) {
      emit(AuthErrorState(message: "حدث خطأ ما"));
    }
  }

  Future<void> register({required UserTypeEnum userType}) async {
    emit(AuthLoadingState());
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      var user = credential.user;

      user?.updateDisplayName(nameController.text);
      // id, name, email

      // user PhotoURL as Role
      user?.updatePhotoURL(userType.value);

      // store data in firestore

      if (userType == UserTypeEnum.doctor) {
        var doctor = DoctorModel(
          uid: user?.uid,
          name: nameController.text,
          email: emailController.text,
          rating: 3,
        );

        await FirestoreServices.createDoctor(doctor);
      } else {
        var patient = PatientModel(
          uid: user?.uid,
          name: nameController.text,
          email: emailController.text,
        );
        await FirestoreServices.createPatient(patient);
      }

      SharedPref.setUserData(
        UserModel(
          uid: user?.uid,
          name: nameController.text,
          email: emailController.text,
          role: userType.value,
        ),
      );

      emit(AuthSuccessState(userType));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState(message: "كلمة المرور ضعيفة"));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState(message: "البريد الالكتروني مستخدم مسبقا"));
      } else {
        emit(AuthErrorState(message: "حدث خطأ ما"));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthErrorState(message: "حدث خطأ ما"));
    }
  }
}

// Auth (FirebaseAuth) ==> small database for user data
// - create account - login - logout

// Database (Firestore). ==> large database for project (Main database)
// - save data - update data - delete data
// collection => list of documents => document => data {}

// ERD
// Users, Doctors, Patients, Hospitals, Pharmacies

// User => Profile. -- collection.where(id:). => Map
