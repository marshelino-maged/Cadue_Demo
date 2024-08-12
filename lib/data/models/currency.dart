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