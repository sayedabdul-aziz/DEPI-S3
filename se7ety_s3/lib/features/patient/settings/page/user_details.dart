import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/components/buttons/main_button.dart';
import 'package:se7ety/core/services/firebase/firestore_provider.dart';
import 'package:se7ety/core/services/local/shared_pref.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/auth/data/models/patient_model.dart';

class UpdatePatientScreen extends StatefulWidget {
  const UpdatePatientScreen({super.key});

  @override
  State<UpdatePatientScreen> createState() => _UpdatePatientScreenState();
}

class _UpdatePatientScreenState extends State<UpdatePatientScreen> {
  List labelName = ["الاسم", "رقم الهاتف", "المدينة", "نبذه تعريفية", "العمر"];

  List key = ["name", "phone", "city", "bio", "age"];

  @override
  Widget build(BuildContext context) {
    String userId = SharedPref.getUserData()?.uid ?? '';
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            splashRadius: 25,
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Text('اعدادات الحساب'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: FutureBuilder(
          future: FirestoreProvider.getPatientById(userId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            var userData = snapshot.data;
            return ListView(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                labelName.length,
                (index) => InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        var con = TextEditingController(
                          text:
                              userData?[key[index]] == '' ||
                                  userData?[key[index]] == null
                              ? 'لم تضاف'
                              : userData?[key[index]],
                        );
                        var form = GlobalKey<FormState>();
                        return SimpleDialog(
                          alignment: Alignment.center,
                          contentPadding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          children: [
                            Form(
                              key: form,
                              child: Column(
                                children: [
                                  Text(
                                    'ادخل ${labelName[index]}',
                                    style: TextStyles.title,
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: con,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.whiteColor,
                                    ),
                                    // decoration: InputDecoration(
                                    //     hintText: value[index]),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'من فضلك ادخل ${labelName[index]}.';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  MainButton(
                                    text: 'حفظ التعديل',
                                    onPressed: () {
                                      if (form.currentState!.validate()) {
                                        updateData(key[index], con.text);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 16,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(labelName[index], style: TextStyles.body),
                        Text(
                          userData?[key[index]] == '' ||
                                  userData?[key[index]] == null
                              ? 'Not Added'
                              : userData?[key[index]],
                          style: TextStyles.body,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> updateData(String key, value) async {
    var user = FirebaseAuth.instance.currentUser;
    await FirestoreProvider.updatePatient(
      PatientModel(
        uid: user!.uid,
        name: key == "name" ? value : null,
        phone: key == "phone" ? value : null,
        city: key == "city" ? value : null,
        bio: key == "bio" ? value : null,
        age: key == "age" ? value : null,
        image: null,
      ),
    );
    if (key == "name") {
      await user.updateDisplayName(value);
    }
    Navigator.pop(context);
    setState(() {});
  }
}
