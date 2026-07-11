class AppointmentModel {
  final String patientID;
  final String doctorID;
  final String name;
  final String phone;
  final String description;
  final String doctorName;
  final String location;
  final DateTime date;
  final bool isComplete;
  final double? rating;

  AppointmentModel({
    required this.patientID,
    required this.doctorID,
    required this.name,
    required this.phone,
    required this.description,
    required this.doctorName,
    required this.location,
    required this.date,
    required this.isComplete,
    this.rating,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      patientID: json['patientID'],
      doctorID: json['doctorID'],
      name: json['name'],
      phone: json['phone'],
      description: json['description'],
      doctorName: json['doctorName'],
      location: json['location'],
      date: DateTime.parse(json['date']),
      isComplete: json['isComplete'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientID': patientID,
      'doctorID': doctorID,
      'name': name,
      'phone': phone,
      'description': description,
      'doctorName': doctorName,
      'location': location,
      'date': date.toIso8601String(),
      'isComplete': isComplete,
      'rating': rating,
    };
  }
}
