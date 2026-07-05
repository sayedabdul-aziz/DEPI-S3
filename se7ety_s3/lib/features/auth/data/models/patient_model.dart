import 'package:se7ety/features/auth/data/models/user_model.dart';

class PatientModel extends UserModel {
  String? age;
  String? phone;
  int? gender;
  String? bio;
  String? city;

  PatientModel({
    super.name,
    super.image,
    this.age,
    super.email,
    this.phone,
    this.bio,
    this.city,
    super.uid,
    this.gender,
  });

  PatientModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    age = json['age'];
    email = json['email'];
    phone = json['phone'];
    bio = json['bio'];
    city = json['city'];
    uid = json['uid'];
    gender = json['gender'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['age'] = age;
    data['email'] = email;
    data['phone'] = phone;
    data['bio'] = bio;
    data['city'] = city;
    data['uid'] = uid;
    data['gender'] = gender;
    return data;
  }

  Map<String, dynamic> toUpdateData() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (image != null) data['image'] = image;
    if (age != null) data['age'] = age;
    if (email != null) data['email'] = email;
    if (phone != null) data['phone'] = phone;
    if (bio != null) data['bio'] = bio;
    if (city != null) data['city'] = city;
    if (gender != null) data['gender'] = gender;
    return data;
  }
}
