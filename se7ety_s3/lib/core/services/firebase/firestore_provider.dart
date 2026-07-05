import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/auth/data/models/patient_model.dart';

class FirestoreServices {
  static final firestore = FirebaseFirestore.instance;
  static final CollectionReference patient = firestore.collection('patient');
  static final CollectionReference doctor = firestore.collection('doctor');

  static Future<void> createPatient(PatientModel model) async {
    await patient.doc(model.uid).set(model.toJson());
  }

  static Future<void> createDoctor(DoctorModel model) async {
    await doctor.doc(model.uid).set(model.toJson());
  }

  static Future<void> updateDoctor(DoctorModel model) async {
    await doctor.doc(model.uid).update(model.toUpdateData());
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