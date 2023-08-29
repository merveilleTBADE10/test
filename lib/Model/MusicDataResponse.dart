class MusicDataResponse {
  String? id;
  String? title;
  String? description;
  int? duration;
  bool? public;
  bool? is_loved_track;
  bool? collaborative;
  int? nbTracks;
  int? unseen_track_count;
  int? fans;
  String? link;
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXL;
  String? checksum;
  String? tracklist;
  String? creationDate;
  String? md5Image;
  String? pictureType;
  int? timeAdd;
  int? timeMod;
  Creator? creator;
  String? type;

  MusicDataResponse({
    this.id,
    this.title,
    this.duration,
    this.public,
    this.is_loved_track,
    this.collaborative,
    this.nbTracks,
    this.unseen_track_count,
    this.fans,
    this.link,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXL,
    this.checksum,
    this.tracklist,
    this.creationDate,
    this.md5Image,
    this.pictureType,
    this.timeAdd,
    this.timeMod,
    this.creator,
    this.type,
  });

  factory MusicDataResponse.fromJson(Map<String, dynamic> json) {
    return MusicDataResponse(
      id: json["id"].toString(),
      title: json['title'],
      duration: json['duration'],
      public: json['public'] ?? false,
      is_loved_track: json['is_loved_track'],
      collaborative: json['collaborative'],
      nbTracks: json['nb_tracks'],
      fans: json['fans'],
      link: json['link'],
      picture: json['picture'],
      pictureSmall: json['picture_small'],
      pictureMedium: json['picture_medium'],
      pictureBig: json['picture_big'],
      pictureXL: json['picture_xl'],
      checksum: json['checksum'],
      tracklist: json['tracklist'],
      creationDate: json['creation_date'],
      md5Image: json['md5_image'],
      pictureType: json['picture_type'],
      timeAdd: json['time_add'],
      timeMod: json['time_mod'],
      creator: Creator.fromJson(json['creator']),
      type: json['type'],
    );
  }
}

class Creator {
  String? id;
  String? name;
  String? tracklist;
  String? type;

  Creator({
    this.id,
    this.name,
    this.tracklist,
    this.type,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      id: json["id"].toString(),
      name: json['name'],
      tracklist: json['tracklist'],
      type: json['type'],
    );
  }
}
