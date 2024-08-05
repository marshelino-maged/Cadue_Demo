class ProductModel {
  int? id;
  String? name;
  String? status;
  double? price;
  double? priceAfterDiscount;
  Currency? currency;
  bool? isVisible;
  bool? isWrappable;
  bool? inStock;
  double? avgRate;
  int? reviewsCount;
  String? dynamicLink;
  String? targetAge;
  String? targetGender;
  int? defaultVariantId;
  String? thumbnail;
  String? image;
  String? approvalStatus;
  int? masterVariantId;
  Store? store;
  IsWishedByCurrentUser? isWishedByCurrentUser;

  ProductModel({this.id, this.name, this.status, this.price, this.priceAfterDiscount, this.currency, this.isVisible, this.isWrappable, this.inStock, this.avgRate, this.reviewsCount, this.dynamicLink, this.targetAge, this.targetGender, this.defaultVariantId, this.thumbnail, this.image, this.approvalStatus, this.masterVariantId, this.store, this.isWishedByCurrentUser});
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    isVisible = json['is_visible'];
    isWrappable = json['is_wrappable'];
    inStock = json['in_stock'];
    avgRate = json['avg_rate'];
    reviewsCount = json['reviews_count'];
    dynamicLink = json['dynamic_link'];
    targetAge = json['target_age'];
    targetGender = json['target_gender'];
    defaultVariantId = json['default_variant_id'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    approvalStatus = json['approval_status'];
    masterVariantId = json['master_variant_id'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    isWishedByCurrentUser = json['is_wished_by_current_user'] != null ? IsWishedByCurrentUser.fromJson(json['is_wished_by_current_user']) : null;
  }
}

class Currency {
  int? id;
  String? name;
  String? lookupKey;

  Currency({this.id, this.name, this.lookupKey});
  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lookupKey = json['lookup_key'];
  }
}

class Store {
  int? id;
  String? name;
  String? firebaseUid;
  Details? details;
  String? logo;
  String? tags;

  Store({this.id, this.name, this.firebaseUid, this.details, this.logo, this.tags});
  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firebaseUid = json['firebase_uid'];
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
    logo = json['logo'];
    tags = json['tags'];
  }
}

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

class IsWishedByCurrentUser {
  bool? any;
  Hadeeny? hadeeny;
  Occasion? occasion;

  IsWishedByCurrentUser({this.any, this.hadeeny, this.occasion});
  IsWishedByCurrentUser.fromJson(Map<String, dynamic> json) {
    any = json['any'];
    hadeeny = json['hadeeny'] != null ? Hadeeny.fromJson(json['hadeeny']) : null;
    occasion = json['occasion'] != null ? Occasion.fromJson(json['occasion']) : null;
  }
}

class Hadeeny {
  bool? isWished;
  List<int>? variantIds;

  Hadeeny({this.isWished, this.variantIds});
  Hadeeny.fromJson(Map<String, dynamic> json) {
    isWished = json['is_wished'];
    variantIds = json['variant_ids'].cast<int>();
  }
}

class Occasion {
  bool? isWished;
  List<int>? variantIds;
  List<int>? occasionIds;

  Occasion({this.isWished, this.variantIds, this.occasionIds});
  Occasion.fromJson(Map<String, dynamic> json) {
    isWished = json['is_wished'];
    variantIds = json['variant_ids'].cast<int>();
    occasionIds = json['occasion_ids'].cast<int>();
  }
}