class Album {
  final int? userId;
  final int? id;
  final String? title;
  const Album({this.userId, this.id, this.title});
  factory Album.getfromJson(Map<String, dynamic> json) {
    return Album(userId: json['userId'], id: json['id'], title: json['title']);
  }
}
