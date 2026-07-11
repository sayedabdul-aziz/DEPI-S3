import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ety/core/routes/navigation.dart';
import 'package:se7ety/core/services/firebase/firestore_provider.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/patient/appointments/widgets/appointment_card.dart';
import 'package:se7ety/features/patient/booking/data/appointment_model.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مواعيد الحجز')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: FirestoreProvider.getPatientAppointments(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                log(snapshot.error.toString());
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return snapshot.data!.docs.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/no_scheduled.svg',
                              width: 250,
                            ),
                            Text(
                              'لا يوجد حجوزات قادمة',
                              style: TextStyles.body,
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data?.docs.length ?? 0,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                        itemBuilder: (context, index) {
                          AppointmentModel model = AppointmentModel.fromJson(
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>,
                          );
                          String documentId = snapshot.data!.docs[index].id;

                          return AppointmentCard(
                            model: model,
                            onRemove: () =>
                                showAlertDialog(context, documentId),
                          );
                        },
                      );
              },
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String docID) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text("حذف الحجز"),
          content: const Text("هل متاكد من حذف هذا الحجز ؟"),
          actions: [
            TextButton(
              child: const Text("لا"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("نعم"),
              onPressed: () {
                FirestoreProvider.deleteAppointment(docID).then((_) {
                  pop(context);
                  setState(() {});
                });
              },
            ),
          ],
        );
      },
    );
  }
}
