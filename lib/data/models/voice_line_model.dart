import 'package:valorant_app/data/models/media_model.dart';

class VoiceLineModel {
  double minDuration;
  double maxDuration;
  List<MediaModel> mediaList;

  VoiceLineModel({
    required this.minDuration,
    required this.maxDuration,
    required this.mediaList,
  });

  factory VoiceLineModel.fromJson(Map<String, dynamic> json) => VoiceLineModel(
        minDuration: json["minDuration"]?.toDouble(),
        maxDuration: json["maxDuration"]?.toDouble(),
        mediaList: List<MediaModel>.from(json["mediaList"].map((x) => MediaModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "minDuration": minDuration,
        "maxDuration": maxDuration,
        "mediaList": List<dynamic>.from(mediaList.map((x) => x.toJson())),
      };
}
