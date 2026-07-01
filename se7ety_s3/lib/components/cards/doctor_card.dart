// import 'package:flutter/material.dart';
// import 'package:se7ety/core/routes/navigation.dart';
// import 'package:se7ety/core/routes/routes.dart';
// import 'package:se7ety/core/utils/colors.dart';
// import 'package:se7ety/core/utils/text_styles.dart';

// class DoctorCard extends StatelessWidget {
//   const DoctorCard({super.key, required this.doctor, this.isClickable = true});

//   final DoctorModel doctor;
//   final bool isClickable;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
//       margin: const EdgeInsets.only(top: 10),
//       width: double.infinity,
//       height: 80,
//       decoration: BoxDecoration(
//         color: Colors.blue[50],
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(-3, 0),
//             blurRadius: 15,
//             color: Colors.grey.withOpacity(.1),
//           ),
//         ],
//       ),
//       child: InkWell(
//         onTap: () {
//           if (isClickable) {
//             pushTo(context, Routes.doctorProfile, extra: doctor);
//           }
//         },
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(13)),
//               child: Container(
//                 height: 55,
//                 width: 55,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: AppColors.whiteColor,
//                 ),
//                 child: Image.network(
//                   doctor.image ?? '',
//                   height: 50,
//                   width: 50,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 20),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     doctor.name ?? '',
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyles.title.copyWith(fontSize: 16),
//                   ),
//                   Text(doctor.specialization ?? '', style: TextStyles.body),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(doctor.rating.toString(), style: TextStyles.body),
//                 const SizedBox(width: 3),
//                 const Icon(
//                   Icons.star_rate_rounded,
//                   size: 20,
//                   color: Colors.orange,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
