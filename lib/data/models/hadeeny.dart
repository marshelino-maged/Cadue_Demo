class Hadeeny {
  bool? isWished;
  List<int>? variantIds;

  Hadeeny({this.isWished, this.variantIds});
  Hadeeny.fromJson(Map<String, dynamic> json) {
    isWished = json['is_wished'];
    variantIds = json['variant_ids'].cast<int>();
  }
}