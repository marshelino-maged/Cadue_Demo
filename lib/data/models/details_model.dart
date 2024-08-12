import 'package:demo_project/data/models/currency.dart';
import 'package:demo_project/data/models/is_wished_by_current_user.dart';
import 'package:demo_project/data/models/media.dart';
import 'package:demo_project/data/models/store.dart';

class DetailsModel {
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
  String? description;
  List<Media>? media;
  Store? store;
  String? occasionTypes;
  String? categoryNames;
  IsWishedByCurrentUser? isWishedByCurrentUser;
  String? createdAt;
  String? updatedAt;

  DetailsModel(
      {this.id,
      this.name,
      this.status,
      this.price,
      this.priceAfterDiscount,
      this.currency,
      this.isVisible,
      this.isWrappable,
      this.inStock,
      this.avgRate,
      this.reviewsCount,
      this.dynamicLink,
      this.targetAge,
      this.targetGender,
      this.defaultVariantId,
      this.thumbnail,
      this.image,
      this.approvalStatus,
      this.masterVariantId,
      this.description,
      this.media,
      this.store,
      this.occasionTypes,
      this.categoryNames,
      this.isWishedByCurrentUser,
      this.createdAt,
      this.updatedAt});
  DetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
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
    description = json['description'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    occasionTypes = json['occasion_types'];
    categoryNames = json['category_names'];
    isWishedByCurrentUser = json['is_wished_by_current_user'] != null
        ? IsWishedByCurrentUser.fromJson(json['is_wished_by_current_user'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
