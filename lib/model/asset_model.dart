class AssetModel {
  final String? username;
  final String? description;
  final String? title;
  final String? thumb;
  final String? full;

  AssetModel(
      {this.username, this.description, this.title, this.thumb, this.full});

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      username: json['user']['username'],
      description: json['description'],
      title: json['id'],
      thumb: json['urls']['thumb'],
      full: json['urls']['full'],
    );
  }
}
