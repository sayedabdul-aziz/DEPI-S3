class UserModel {
  String? uid;
  String? name;
  String? email;
  String? role;
  String? image;
  UserModel({this.uid, this.name, this.email, this.role, this.image});

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'role': role,
      'image': image,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
