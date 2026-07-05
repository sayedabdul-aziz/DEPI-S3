enum UserTypeEnum {
  patient("patient"),
  doctor("doctor");

  final String value;

  const UserTypeEnum(this.value);

  static UserTypeEnum fromValue(String value) {
    switch (value) {
      case "patient":
        return UserTypeEnum.patient;
      case "doctor":
        return UserTypeEnum.doctor;
      default:
        return UserTypeEnum.patient;
    }
  }
}




// PaymentStatus (Pending("PENDING"), Success(2), Failed(3), Cancelled, Refunded)