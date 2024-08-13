class Details {
  String? status;
  String? email;
  String? profileStatus;
  String? countryCode;
  String? phoneNumber;
  String? rejectionReason;
  bool? isVerified;
  bool? isEmailVerified;

  Details({this.status, this.email, this.profileStatus, this.countryCode, this.phoneNumber, this.rejectionReason, this.isVerified, this.isEmailVerified});
  Details.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    email = json['email'];
    profileStatus = json['profile_status'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    rejectionReason = json['rejection_reason'];
    isVerified = json['is_verified'];
    isEmailVerified = json['is_email_verified'];
  }
}