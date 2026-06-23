// {
//     "governorate_id":4,
//     "name" : "ahmed",
//     "phone" : "010101010101",
//     "address":"cairo",
//     "email" : "sayed@gmail.com"
// }

class PlaceOrderParams {
  final int governorateId;
  final String name;
  final String phone;
  final String address;
  final String email;

  PlaceOrderParams({
    required this.governorateId,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    'governorate_id': governorateId,
    'name': name,
    'phone': phone,
    'address': address,
    'email': email,
  };
}
