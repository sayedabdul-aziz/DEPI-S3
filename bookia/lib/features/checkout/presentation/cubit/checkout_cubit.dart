import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/checkout/data/models/governorate_response/datum.dart';
import 'package:bookia/features/checkout/data/models/place_order_params.dart';
import 'package:bookia/features/checkout/data/repo/checkout_repo.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitialState());

  List<Governorate> governorates = [];

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final governorateController = TextEditingController();

  Governorate? selectedGovernorate;

  Future<void> getGovernorates() async {
    await Future.delayed(const Duration(milliseconds: 500));

    emit(CheckoutLoadingState());
    var data = await CheckoutRepo.getGovernorates();
    if (data != null) {
      governorates = data.data ?? [];
      emit(GetGovernoratesSuccessState());
    } else {
      emit(CheckoutErrorState('Something went Wrong'));
    }
  }

  Future<void> placeOrder() async {
    emit(CheckoutLoadingState());

    var params = PlaceOrderParams(
      governorateId: selectedGovernorate!.id!,
      name: nameController.text,
      phone: phoneController.text,
      address: addressController.text,
      email: SharedPref.getUserInfo()?.email ?? '',
    );
    var data = await CheckoutRepo.placeOrder(params);
    if (data) {
      emit(CheckoutSuccessState());
    } else {
      emit(CheckoutErrorState('Something went Wrong'));
    }
  }
}
