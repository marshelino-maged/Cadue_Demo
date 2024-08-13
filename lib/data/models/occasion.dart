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