import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se7ety/core/services/local/shared_pref.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/auth/data/models/patient_model.dart';
import 'package:se7ety/features/patient/booking/data/appointment_model.dart';

class FirestoreProvider {
  static final firestore = FirebaseFirestore.instance;
  static final CollectionReference patient = firestore.collection('patient');
  static final CollectionReference doctor = firestore.collection('doctor');
  static final CollectionReference appointment = firestore.collection(
    'appointment',
  );

  static Future<void> createPatient(PatientModel model) async {
    await patient.doc(model.uid).set(model.toJson());
  }

  static Future<void> createDoctor(DoctorModel model) async {
    await doctor.doc(model.uid).set(model.toJson());
  }

  static Future<void> updateDoctor(DoctorModel model) async {
    await doctor.doc(model.uid).update(model.toUpdateData());
  }

  static Future<void> updatePatient(PatientModel model) async {
    await patient.doc(model.uid).update(model.toUpdateData());
  }

  static Future<DocumentSnapshot> getPatientById(String id) async {
    return await patient.doc(id).get();
  }

  static Future<DocumentSnapshot> getDoctorById(String id) async {
    return await doctor.doc(id).get();
  }

  static Future<QuerySnapshot> sortingDoctorByRating() async {
    return await doctor
        .where('specialization', isNull: false)
        .orderBy('rating', descending: true)
        .get();
  }

  static Future<QuerySnapshot> getDoctorBySpecialization(String value) async {
    return await doctor.where('specialization', isEqualTo: value).get();
  }

  static Future<QuerySnapshot> searchForDoctor(String query) async {
    return await doctor
        .where('specialization', isNull: false)
        .orderBy('name', descending: false)
        .startAt([query])
        .endAt(['$query\uf8ff'])
        .get();
  }

  static Future<void> createAppointment(AppointmentModel model) async {
    await appointment.doc().set(model.toJson());
  }

  static Future<QuerySnapshot> getPatientAppointments() async {
    var id = SharedPref.getUserData()?.uid ?? '';
    return await appointment
        .where('patientID', isEqualTo: id)
        .orderBy('date')
        .get();
  }

  static Future<QuerySnapshot> getDoctorAppointments() async {
    var id = SharedPref.getUserData()?.uid ?? '';
    return await appointment.where('doctorID', isEqualTo: id).get();
  }

  static Future<void> deleteAppointment(String docID) async {
    await appointment.doc(docID).delete();
  }
}




// Firestore (Collections => Documents => Data)

// Specific Doc => (Collection, Doc ID) => Data {}  - Profile

// All Doc => collection.get() , collection.snapshots()

// Sorting => collection.orderBy("field", descending: true).get()

// Filter => collection.where("field", isEqualTo: value).get()

// Search => collection.startAt(["value"]).endAt(["value"]).get()

// limit and Pagination => collection.orderBy("field", descending: true).limit(20).get()


//! delete Specific doc => (Collection, Doc ID)

//! update Specific doc => (Collection, Doc ID, Data)