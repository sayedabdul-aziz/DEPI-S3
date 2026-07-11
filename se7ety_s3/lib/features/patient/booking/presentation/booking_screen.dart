import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:se7ety/components/alert_dialog.dart';
import 'package:se7ety/components/buttons/main_button.dart';
import 'package:se7ety/components/cards/doctor_card.dart';
import 'package:se7ety/components/inputs/custom_text_field.dart';
import 'package:se7ety/core/extentions/app_regex.dart';
import 'package:se7ety/core/extentions/dialogs.dart';
import 'package:se7ety/core/routes/navigation.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/services/firebase/firestore_provider.dart';
import 'package:se7ety/core/services/local/shared_pref.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/patient/booking/data/appointment_model.dart';
import 'package:se7ety/features/patient/booking/data/available_appointments.dart';

class BookingScreen extends StatefulWidget {
  final DoctorModel doctor;

  const BookingScreen({super.key, required this.doctor});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  TimeOfDay currentTime = TimeOfDay.now();
  String? booking_hour;

  int selectedHour = -1;

  User? user;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
  }

  List<int> availableHours = [];

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('احجز مع دكتورك')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              DoctorCard(doctor: widget.doctor, isClickable: false),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '-- ادخل بيانات الحجز --',
                        style: TextStyles.title,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'اسم المريض',
                      style: TextStyles.body.copyWith(
                        color: AppColors.darkColor,
                      ),
                    ),
                    const Gap(10),
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) return 'من فضلك ادخل اسم المريض';
                        return null;
                      },
                      style: TextStyles.body.copyWith(),
                      textInputAction: TextInputAction.next,
                    ),
                    const Gap(15),
                    Text(
                      'رقم الهاتف',
                      style: TextStyles.body.copyWith(
                        color: AppColors.darkColor,
                      ),
                    ),
                    const Gap(10),
                    CustomTextField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,

                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل رقم الهاتف';
                        } else if (!AppRegex.isEgyptianPhoneValid(value)) {
                          return 'يرجي ادخال رقم هاتف صحيح';
                        }
                        return null;
                      },
                    ),
                    const Gap(15),
                    Text(
                      'وصف الحاله',
                      style: TextStyles.body.copyWith(
                        color: AppColors.darkColor,
                      ),
                    ),
                    const Gap(10),
                    TextFormField(
                      controller: _descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      style: TextStyles.body.copyWith(),
                      textInputAction: TextInputAction.next,
                    ),
                    const Gap(15),
                    Text(
                      'تاريخ الحجز',
                      style: TextStyles.body.copyWith(
                        color: AppColors.darkColor,
                      ),
                    ),
                    const Gap(10),
                    TextFormField(
                      readOnly: true,
                      onTap: () {
                        selectDate(context);
                      },
                      controller: _dateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل تاريخ الحجز';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      style: TextStyles.body.copyWith(),
                      decoration: const InputDecoration(
                        hintText: 'ادخل تاريخ الحجز',
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 18,
                            child: Icon(
                              Icons.date_range_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'وقت الحجز',
                            style: TextStyles.body.copyWith(
                              color: AppColors.darkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Wrap(
                      spacing: 8,
                      children: [
                        for (var hour in availableHours)
                          ChoiceChip(
                            backgroundColor: AppColors.accentColor,
                            // showCheckmark: false,
                            checkmarkColor: AppColors.whiteColor,
                            // avatar: const Icon(Icons.abc),
                            selectedColor: AppColors.primaryColor,
                            label: Text(
                              '${(hour < 10) ? '0' : ''}${hour.toString()}:00',
                              style: TextStyle(
                                color: hour == selectedHour
                                    ? AppColors.whiteColor
                                    : AppColors.darkColor,
                              ),
                            ),
                            selected: hour == selectedHour,
                            onSelected: (selected) {
                              setState(() {
                                selectedHour = hour;
                                booking_hour =
                                    '${(hour < 10) ? '0' : ''}${hour.toString()}:00';
                              });
                            },
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: MainButton(
          text: 'تأكيد الحجز',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (selectedHour != -1) {
                _createAppointment();
              } else {
                showMyDialog(context, 'من فضلك اختر وقت الحجز');
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> _createAppointment() async {
    // dateTime format : yyyy-MM-dd hh:mm:ss
    var appointmentData = AppointmentModel(
      patientID: SharedPref.getUserData()?.uid ?? '',
      doctorID: widget.doctor.uid ?? '',
      doctorName: widget.doctor.name ?? '',
      location: widget.doctor.address ?? '',
      name: _nameController.text,
      phone: _phoneController.text,
      description: _descriptionController.text,
      date: DateTime.parse('${_dateController.text} ${booking_hour!}:00'),
      isComplete: false,
    );
    await FirestoreProvider.createAppointment(appointmentData).then((_) {
      showAlertDialog(
        context,
        title: 'تم تسجيل الحجز !',
        ok: 'اضغط للانتقال',
        onTap: () {
          pushToBase(context, Routes.mainPatient);
        },
      );
    });
  }

  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      selectableDayPredicate: (day) {
        // ignore fridays
        if (day.weekday == 5) {
          return false;
        }
        return true;
      },
    ).then((date) {
      if (date != null) {
        _dateController.text = DateFormat('yyyy-MM-dd').format(date);
        availableHours = getAvailableAppointments(
          date,
          widget.doctor.openHour ?? "0",
          widget.doctor.closeHour ?? "0",
        );
        setState(() {});
      }
    });
  }
}


// future work

// customize days and hours
// booked slots

// appointments => filter with data and doctorID ==> [10:00, 13:00]
// slots 