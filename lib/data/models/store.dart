import 'package:demo_project/data/models/details.dart';

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