class OccasionModel {
  int? id;
  String? name;
  String? icon;
  String? banner;
  String? description;
  String? createdAt;
  String? updatedAt;

  OccasionModel({this.id, this.name, this.icon, this.banner, this.description, this.createdAt, this.updatedAt});
  OccasionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    banner = json['banner'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
