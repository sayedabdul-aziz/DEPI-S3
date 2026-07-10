import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/components/cards/doctor_card.dart';
import 'package:se7ety/core/services/firebase/firestore_provider.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';

// Firestore (Collection => list of docs => (id, data {}))

//* GET
// Specific Doc => Collection.doc(id).get() => My Profile

// All Docs => Collection.get() / Collection.snapshots()
// Sorting Docs => Collection.orderBy('field', descending: true).get()
// Filtering Docs => Collection.where('field', isEqualTo: 'value').get()
// Searching Docs => Collection.startAt('value').endAt('value').get()
// Pagination => Collection.limit(10).get()

// Future Builder vs Stream Builder

//* SET
// Specific Doc => Collection.doc(id).set(data) / Collection.doc().set(data) / Collection.add(data)

//* UPDATE
// Specific Doc => Collection.doc(id).update(data)

//* DELETE
// Specific Doc => Collection.doc(id).delete()

// Cubit (State Management)
// Future Builder and Stream Builder

class TopRatedList extends StatefulWidget {
  const TopRatedList({super.key});

  @override
  State<TopRatedList> createState() => _TopRatedListState();
}

class _TopRatedListState extends State<TopRatedList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreProvider.sortingDoctorByRating(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasError){}
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data?.docs.length, // all doctors in firebase
          itemBuilder: (context, index) {
            DoctorModel doctor = DoctorModel.fromJson(
              snapshot.data?.docs[index].data() as Map<String, dynamic>,
            );

            return DoctorCard(doctor: doctor);
          },
        );
      },
    );
  }
}
