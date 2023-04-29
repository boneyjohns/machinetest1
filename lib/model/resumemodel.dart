class Resumemodel {
  final String fileurl;
  final String id;

  Resumemodel({required this.fileurl, required this.id});

  Map<String, dynamic> toJson() => {'fileurl': fileurl, 'id': id};
  static Resumemodel fromJson(Map<String, dynamic> json) =>
      Resumemodel(fileurl: json['fileurl'], id: json['id']);
}
