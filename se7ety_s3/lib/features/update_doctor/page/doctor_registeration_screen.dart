import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:se7ety/components/buttons/main_button.dart';
import 'package:se7ety/components/inputs/custom_text_field.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/core/extentions/app_regex.dart';
import 'package:se7ety/core/extentions/dialogs.dart';
import 'package:se7ety/core/routes/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/auth/data/models/specializations.dart';
import 'package:se7ety/features/update_doctor/cubit/update_doctor_profile_cubit.dart';
import 'package:se7ety/features/update_doctor/cubit/update_doctor_profile_state.dart';

class UpdateDoctorProfileScreen extends StatefulWidget {
  const UpdateDoctorProfileScreen({super.key});

  @override
  State<UpdateDoctorProfileScreen> createState() =>
      _UpdateDoctorProfileScreenState();
}

class _UpdateDoctorProfileScreenState extends State<UpdateDoctorProfileScreen> {
  String? _imagePath;

  Future<void> _pickImage(UpdateDoctorProfileCubit cubit) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
        cubit.imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateDoctorProfileCubit>();
    return BlocListener<UpdateDoctorProfileCubit, UpdateDoctorProfileState>(
      listener: (context, state) {
        if (state is UpdateDoctorProfileLoadingState) {
          showLoadingDialog(context);
        } else if (state is UpdateDoctorProfileSuccessState) {
          pop(context);
          log("success --");
        } else if (state is UpdateDoctorProfileErrorState) {
          pop(context);
          showMyDialog(context, state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('إكمال عملية التسجيل')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: AppColors.whiteColor,
                              backgroundImage: (_imagePath != null)
                                  ? FileImage(File(_imagePath!))
                                  : AssetImage(AppImages.emptyDocSvg),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _pickImage(cubit);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Theme.of(
                                context,
                              ).scaffoldBackgroundColor,
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                        child: Row(
                          children: [
                            Text(
                              'التخصص',
                              style: TextStyles.body.copyWith(
                                color: AppColors.darkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButton<String?>(
                          isExpanded: true,
                          iconEnabledColor: AppColors.primaryColor,
                          hint: Text(
                            'اختر التخصص',
                            style: TextStyles.body.copyWith(
                              color: AppColors.greyColor,
                            ),
                          ),
                          icon: const Icon(Icons.expand_circle_down_outlined),
                          value: cubit.specialization,
                          onChanged: (String? newValue) {
                            setState(() {
                              cubit.specialization = newValue;
                            });
                          },
                          items: [
                            for (var specialization in specializations)
                              DropdownMenuItem(
                                value: specialization,
                                child: Text(specialization),
                              ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'نبذة تعريفية',
                              style: TextStyles.body.copyWith(
                                color: AppColors.darkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomTextField(
                        controller: cubit.bioController,
                        maxLines: 4,
                        hintText:
                            'سجل المعلومات الطبية العامة مثل تعليمك الأكاديمي وخبراتك السابقة...',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل النبذة التعريفية';
                          }
                          return null;
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'عنوان العيادة',
                              style: TextStyles.body.copyWith(
                                color: AppColors.darkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomTextField(
                        controller: cubit.addressController,
                        hintText: '5 شارع مصدق - الدقي - الجيزة',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل عنوان العيادة';
                          }
                          return null;
                        },
                      ),
                      _workHours(cubit),
                      _phoneNumbers(cubit),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: MainButton(
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  if (cubit.imageFile.path.isEmpty) {
                    showMyDialog(context, 'من فضلك ادخل صورة المستخدم');
                  } else {
                    cubit.updateProfile();
                  }
                }
              },
              text: "التسجيل",
            ),
          ),
        ),
      ),
    );
  }

  Column _workHours(UpdateDoctorProfileCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'ساعات العمل من',
                      style: TextStyles.body.copyWith(
                        color: AppColors.darkColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'الي',
                      style: TextStyles.body.copyWith(
                        color: AppColors.darkColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                readOnly: true,
                controller: cubit.openHourController,
                validator: (value) {
                  if (value!.isEmpty) return 'مطلوب';
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () => _showStartTimePicker(cubit),
                  icon: const Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
                hintText: '00:00',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextField(
                readOnly: true,
                controller: cubit.closeHourController,
                validator: (value) {
                  if (value!.isEmpty) return 'مطلوب';
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () => _showEndTimePicker(cubit),
                  icon: const Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
                hintText: '00:00',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _phoneNumbers(UpdateDoctorProfileCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'رقم الهاتف 1',
                style: TextStyles.body.copyWith(color: AppColors.darkColor),
              ),
            ],
          ),
        ),
        CustomTextField(
          controller: cubit.phone1Controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
          ],

          hintText: '+20xxxxxxxxxx',
          validator: (value) {
            if (value!.isEmpty) {
              return 'من فضلك ادخل الرقم';
            } else if (AppRegex.isEgyptianPhoneValid(value) == false) {
              return 'من فضلك ادخل رقم صحيح';
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'رقم الهاتف 2 (اختياري)',
                style: TextStyles.body.copyWith(color: AppColors.darkColor),
              ),
            ],
          ),
        ),
        CustomTextField(
          controller: cubit.phone2Controller,
          keyboardType: TextInputType.number,
          hintText: '+20xxxxxxxxxx',
        ),
      ],
    );
  }

  Future<void> _showStartTimePicker(UpdateDoctorProfileCubit cubit) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      cubit.openHourController.text = picked.hour.toString();
    }
  }

  Future<void> _showEndTimePicker(UpdateDoctorProfileCubit cubit) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        DateTime.now().add(const Duration(minutes: 15)),
      ),
    );
    if (picked != null) {
      cubit.closeHourController.text = picked.hour.toString();
    }
  }
}
