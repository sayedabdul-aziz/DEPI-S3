// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
// import 'package:se7ety/core/utils/colors.dart';
// import 'package:se7ety/core/utils/text_style.dart';

// class MyAppointmentsHistory extends StatefulWidget {
//   const MyAppointmentsHistory({super.key});

//   @override
//   _MyAppointmentsHistoryState createState() => _MyAppointmentsHistoryState();
// }

// class _MyAppointmentsHistoryState extends State<MyAppointmentsHistory> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user;

//   Future<void> _getUser() async {
//     user = _auth.currentUser;
//   }

//   Future<void> deleteAppointment(
//     String docID,
//   ) {
//     return FirebaseFirestore.instance
//         .collection('appointments')
//         .doc('appointments')
//         .collection('all')
//         .doc(docID)
//         .delete();
//   }

//   String _dateFormatter(String timestamp) {
//     String formattedDate =
//         DateFormat('dd-MM-yyyy').format(DateTime.parse(timestamp));
//     return formattedDate;
//   }

//   String _timeFormatter(String timestamp) {
//     String formattedTime =
//         DateFormat('hh:mm').format(DateTime.parse(timestamp));
//     return formattedTime;
//   }

//   showAlertDialog(BuildContext context, String docID) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog.adaptive(
//           title: const Text("حذف الحجز"),
//           content: const Text("هل متاكد من حذف هذا الحجز ؟"),
//           actions: [
//             TextButton(
//               child: const Text("لا"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text("نعم"),
//               onPressed: () {
//                 deleteAppointment(
//                   docID,
//                 );
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   _checkDiff(DateTime date) {
//     var diff = DateTime.now().difference(date).inHours;
//     if (diff > 2) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   _compareDate(String date) {
//     if (_dateFormatter(DateTime.now().toString())
//             .compareTo(_dateFormatter(date)) ==
//         0) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('appointments')
//             .doc('appointments')
//             .collection('all')
//             .where('patientID', isEqualTo: '${user!.email}')
//             .orderBy('date', descending: false)
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return snapshot.data!.docs.isEmpty
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset('assets/images/no_scheduled.svg',
//                           width: 250),
//                       Text('لا يوجد حجوزات قادمة', style: getbodyStyle()),
//                     ],
//                   ),
//                 )
//               : ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   itemCount: snapshot.data?.docs.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot document = snapshot.data!.docs[index];

//                     if (_checkDiff(document['date'].toDate())) {
//                       deleteAppointment(
//                         document.id,
//                       );
//                     }
//                     return Column(
//                       children: [
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Container(
//                           padding: const EdgeInsets.only(
//                             left: 10,
//                             right: 10,
//                           ),
//                           decoration: BoxDecoration(
//                             color: AppColors.accentColor,
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: [
//                               BoxShadow(
//                                 offset: const Offset(-3, 0),
//                                 blurRadius: 15,
//                                 color: Colors.grey.withOpacity(.1),
//                               )
//                             ],
//                           ),
//                           child: ExpansionTile(
//                             childrenPadding: const EdgeInsets.symmetric(
//                               vertical: 10,
//                             ),
//                             expandedCrossAxisAlignment: CrossAxisAlignment.end,
//                             backgroundColor: AppColors.accentColor,
//                             collapsedBackgroundColor: AppColors.accentColor,
//                             title: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 5),
//                                   child: Text(
//                                     'د. ${document['doctor']}',
//                                     style: getTitleStyle(),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             subtitle: Padding(
//                               padding: const EdgeInsets.only(top: 5, left: 5),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.calendar_month_rounded,
//                                           color: AppColors.color1, size: 16),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text(
//                                         _dateFormatter(document['date']
//                                             .toDate()
//                                             .toString()),
//                                         style: getbodyStyle(),
//                                       ),
//                                       const SizedBox(
//                                         width: 30,
//                                       ),
//                                       Text(
//                                         _compareDate(document['date']
//                                                 .toDate()
//                                                 .toString())
//                                             ? "اليوم"
//                                             : "",
//                                         style: getbodyStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.green),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.watch_later_outlined,
//                                           color: AppColors.color1, size: 16),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text(
//                                         _timeFormatter(
//                                           document['date'].toDate().toString(),
//                                         ),
//                                         style: getbodyStyle(),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     bottom: 5, right: 10, left: 16),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       'اسم المريض: ${document['name']}',
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       children: [
//                                         const Icon(Icons.location_on_rounded,
//                                             color: AppColors.color1, size: 16),
//                                         const SizedBox(
//                                           width: 10,
//                                         ),
//                                         Text(
//                                           document['location'],
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     SizedBox(
//                                       width: double.infinity,
//                                       child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                               foregroundColor: AppColors.white,
//                                               backgroundColor:
//                                                   AppColors.redColor),
//                                           onPressed: () {
//                                             showAlertDialog(
//                                                 context, document.id);
//                                           },
//                                           child: const Text('حذف الحجز')),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }
