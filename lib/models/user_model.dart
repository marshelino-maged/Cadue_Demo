class UserModel {
  final int? id;
  final String? userType;
  final String? name;
  final String? avatar;
  final String? countryCode;
  final bool? isVerified;
  final String? phoneNumber;
  final String? email;
  final String? status;
  final String? gender;
  final String? resetPasswordToken;
  final String? verificationCode;
  final String? verificationEmailToken;
  final String? providerAccountId;
  final String? provider;
  final String? source;
  final bool? enablePush;
  final bool? enableOrdersPush;
  final bool? enableOffersPush;
  final String? invitationCode;
  final int? signInCount;
  final String? currentSignInAt;
  final String? currentSignInIp;
  final String? lastSignInAt;
  final String? lastSignInIp;
  final bool? isEmailVerified;
  final String? lat;
  final String? long;
  final String? createdAt;
  final String? updatedAt;
  final String? birthdate;
  final List<String>? hadeenyList;
  final String? firebaseAuthToken;

  UserModel({
    this.id,
    this.userType,
    this.name,
    this.avatar,
    this.countryCode,
    this.isVerified,
    this.phoneNumber,
    this.email,
    this.status,
    this.gender,
    this.resetPasswordToken,
    this.verificationCode,
    this.verificationEmailToken,
    this.providerAccountId,
    this.provider,
    this.source,
    this.enablePush,
    this.enableOrdersPush,
    this.enableOffersPush,
    this.invitationCode,
    this.signInCount,
    this.currentSignInAt,
    this.currentSignInIp,
    this.lastSignInAt,
    this.lastSignInIp,
    this.isEmailVerified,
    this.lat,
    this.long,
    this.createdAt,
    this.updatedAt,
    this.birthdate,
    this.hadeenyList,
    this.firebaseAuthToken,
  });
  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userType = json['user_type'],
        name = json['name'],
        avatar = json['avatar'],
        countryCode = json['country_code'],
        isVerified = json['is_verified'],
        phoneNumber = json['phone_number'],
        email = json['email'],
        status = json['status'],
        gender = json['gender'],
        resetPasswordToken = json['reset_password_token'],
        verificationCode = json['verification_code'],
        verificationEmailToken = json['verification_email_token'],
        providerAccountId = json['provider_account_id'],
        provider = json['provider'],
        source = json['source'],
        enablePush = json['enable_push'],
        enableOrdersPush = json['enable_orders_push'],
        enableOffersPush = json['enable_offers_push'],
        invitationCode = json['invitation_code'],
        signInCount = json['sign_in_count'],
        currentSignInAt = json['current_sign_in_at'],
        currentSignInIp = json['current_sign_in_ip'],
        lastSignInAt = json['last_sign_in_at'],
        lastSignInIp = json['last_sign_in_ip'],
        isEmailVerified = json['is_email_verified'],
        lat = json['lat'],
        long = json['long'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        birthdate = json['birthdate'],
        hadeenyList = json['hadeeny_list']?.cast<String>(),
        firebaseAuthToken = json['firebase_auth_token'];
}
