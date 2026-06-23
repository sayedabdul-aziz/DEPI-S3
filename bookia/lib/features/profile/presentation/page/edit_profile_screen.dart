import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/functions/validations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = SharedPref.getUserInfo();
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccessState) {
          pop(context);
          pushToBase(context, Routes.main, extra: 0);
        } else if (state is ProfileErrorState) {
          pop(context); // close loading
          showMyDialog(context, state.message);
        } else if (state is ProfileLoadingState) {
          showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 75,
            leading: Row(
              children: [
                const Gap(16),
                GestureDetector(
                  onTap: () => pop(context),
                  child: CustomSvgPicture(path: AppImages.backSvg),
                ),
              ],
            ),
            title: const Text('Edit Profile'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  const Gap(50),
                  // image with edit as stack
                  Stack(
                    children: [
                      if (cubit.imageFile != null)
                        ClipOval(
                          child: Image.file(
                            cubit.imageFile!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        )
                      else if (userInfo?.image != null)
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: userInfo!.image!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        )
                      else
                        ClipOval(
                          child: Image.asset(
                            AppImages.profileSvg,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            cubit.pickImage();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: AppColors.backgroundColor,
                              shape: BoxShape.circle,
                            ),
                            child: const CustomSvgPicture(
                              path: AppImages.cameraSvg,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(50),
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
                  const Gap(12),
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
                  const Gap(12),
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
                  const Gap(12),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: MainButton(
              text: 'Save',
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.updateProfile();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
