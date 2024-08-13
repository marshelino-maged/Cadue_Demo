import 'package:demo_project/data/models/hadeeny.dart';
import 'package:demo_project/data/models/occasion.dart';

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