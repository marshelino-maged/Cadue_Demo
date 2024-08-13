class Media {
  int? id;
  String? mediableType;
  int? mediableId;
  String? mediaType;
  String? fileName;
  String? url;
  String? mediaOption;

  Media(
      {this.id,
      this.mediableType,
      this.mediableId,
      this.mediaType,
      this.fileName,
      this.url,
      this.mediaOption});
  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediableType = json['mediable_type'];
    mediableId = json['mediable_id'];
    mediaType = json['media_type'];
    fileName = json['file_name'];
    url = json['url'];
    mediaOption = json['media_option'];
  }
}
