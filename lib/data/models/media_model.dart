class MediaModel {
  int id;
  String wwise;
  String wave;

  MediaModel({
    required this.id,
    required this.wwise,
    required this.wave,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        id: json["id"],
        wwise: json["wwise"],
        wave: json["wave"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wwise": wwise,
        "wave": wave,
      };
}
