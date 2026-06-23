import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/functions/validations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_body_view.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:bookia/features/checkout/presentation/widgets/gov_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key, required this.total});
  final String total;

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  @override
  void initState() {
    super.initState();
    // call getGovernorates when build complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CheckoutCubit>().getGovernorates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutLoadingState) {
          showLoadingDialog(context);
        } else if (state is CheckoutSuccessState) {
          pushToBase(context, Routes.main, extra: 0);
        } else if (state is GetGovernoratesSuccessState) {
          pop(context);
        } else if (state is CheckoutErrorState) {
          pop(context);
          showMyDialog(context, state.message);
        }
      },
      builder: (context, state) {
        var cubit = context.read<CheckoutCubit>();
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () => pop(context),
                  child: CustomSvgPicture(path: AppImages.backSvg),
                ),
              ],
            ),
          ),
          body: _formBuilder(),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:', style: TextStyles.subtitle1),
                    Text("\$${widget.total}", style: TextStyles.subtitle1),
                  ],
                ),
                Gap(16),
                MainButton(
                  text: 'Place Order',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.placeOrder();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _formBuilder() {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        var cubit = context.read<CheckoutCubit>();
        return MyBodyView(
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Place Your Order", style: TextStyles.headline),
                  Gap(10),
                  Text(
                    "Don't worry! It occurs. Please enter the email address linked with your account.",
                    style: TextStyles.body.copyWith(
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  Gap(25),
                  CustomTextFormField(
                    controller: cubit.nameController,
                    hintText: "Full Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your full name";
                      }
                      return null;
                    },
                  ),
                  Gap(12),
                  CustomTextFormField(
                    controller: cubit.phoneController,
                    keyboardType: TextInputType.phone,
                    hintText: "Phone Number",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your phone number";
                      } else if (!isEgyptianPhone(value)) {
                        return "Please enter a valid phone number";
                      }
                      return null;
                    },
                  ),
                  Gap(12),
                  CustomTextFormField(
                    controller: cubit.addressController,
                    hintText: "Address",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your address";
                      }
                      return null;
                    },
                  ),
                  Gap(12),
                  CustomTextFormField(
                    controller: cubit.governorateController,
                    hintText: "Governorate",
                    readOnly: true,
                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                    onTap: () {
                      showGovernoratesBottomSheet(context, cubit.governorates, (
                        gov,
                      ) {
                        cubit.selectedGovernorate = gov;
                        cubit.governorateController.text =
                            gov.governorateNameEn ?? "";
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select your governorate";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
