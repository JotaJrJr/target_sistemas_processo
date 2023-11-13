class NoteModel {
  int? id;
  String? title;
  String? description;
  int? data;

  int? user;

  NoteModel({
    this.id,
    this.title,
    this.description,
    this.data,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'data': data,
      'user': user,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      data: map['data'],
      user: map['user'],
    );
  }
}
