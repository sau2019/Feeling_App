class FeelingValue {
  FeelingValue({
    required this.happy,
    required this.sad,
    required this.energetic,
    required this.calm,
    required this.angry,
    required this.bored,
  });

  String happy;
  String sad;
  String energetic;
  String calm;
  String angry;
  String bored;

  factory FeelingValue.fromJson(Map<String, dynamic> json) => FeelingValue(
        happy: json["Happy"],
        sad: json["Sad"],
        energetic: json["Energetic"],
        calm: json["Calm"],
        angry: json["Angry"],
        bored: json["Bored"],
      );

  Map<String, dynamic> toJson() => {
        "Happy": happy,
        "Sad": sad,
        "Energetic": energetic,
        "Calm": calm,
        "Angry": angry,
        "Bored": bored,
      };
}

class VideoInfo {
  VideoInfo({
    required this.title,
    required this.description,
    required this.youtubeUrl,
  });

  String title;
  String description;
  String youtubeUrl;

  factory VideoInfo.fromJson(Map<String, dynamic> json) => VideoInfo(
        title: json["title"],
        description: json["description"],
        youtubeUrl: json["youtube_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "youtube_url": youtubeUrl,
      };
}
