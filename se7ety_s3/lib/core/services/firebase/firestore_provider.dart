// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:se7ety/features/auth/data/models/doctor_model.dart';
// import 'package:se7ety/features/auth/data/models/patient_model.dart';
// import 'package:se7ety/features/patient/booking/data/appointment_model.dart';

// class FirestoreServices {
//   static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   static final CollectionReference _patientCollection = _firestore.collection(
//     'patient',
//   );
//   static final CollectionReference _doctorCollection = _firestore.collection(
//     'doctor',
//   );
//   static final CollectionReference _appointmentCollection = _firestore
//       .collection('appointment');

//   static Future<void> createDoctor(DoctorModel doctor) {
//     return _doctorCollection.doc(doctor.uid).set(doctor.toJson());
//   }

//   static  Future<void> createPatient(PatientModel patient) {
//     return _patientCollection.doc(patient.uid).set(patient.toJson());
//   }

//   static  Future<void> updateDoctor(DoctorModel doctor) {
//     return _doctorCollection.doc(doctor.uid).update(doctor.toUpdateData());
//   }

//   static Future<DocumentSnapshot<Object?>> getDoctorById(String id) {
//     return _doctorCollection.doc(id).get();
//   }

//   static Future<QuerySnapshot<Object?>> sortDoctorsByRating() {
//     return _doctorCollection.orderBy('rating', descending: true).get();
//   }

//   static Future<QuerySnapshot<Object?>> filterDoctorsBySpecialization(
//     String specialization,
//   ) {
//     return _doctorCollection
//         .where('specialization', isEqualTo: specialization)
//         .get();
//   }

//   static Future<QuerySnapshot<Object?>> getDoctorsByName(String searchKey) {
//     return _doctorCollection.orderBy("name").startAt([searchKey]).endAt([
//       '$searchKey\uf8ff',
//     ]).get();
//   }

//   static Future<void> createAppointment(AppointmentModel appointmentData) {
//     return _appointmentCollection.doc().set(appointmentData.toJson());
//   }

//   static Future<QuerySnapshot<Object?>> getAppointmentsByPatientId() {
//     var userId = FirebaseAuth.instance.currentUser!.uid;
//     return _appointmentCollection
//         .where('patientID', isEqualTo: userId)
//         .orderBy("date")
//         .get();
//   }

//   static Future<QuerySnapshot<Object?>> getAppointmentsByDoctorId() {
//     var userId = FirebaseAuth.instance.currentUser!.uid;
//     return _appointmentCollection.where('doctorID', isEqualTo: userId).get();
//   }

//   static Future<void> deleteAppointment(String docID) {
//     return _appointmentCollection.doc(docID).delete();
//   }
// }
