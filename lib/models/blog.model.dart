class ResultBlogModel {
  List<BlogModel>? results;
  final bool status;
  final String? message;
  ResultBlogModel({this.results, this.status=true, this.message});

  factory ResultBlogModel.fromJson(Map<String, dynamic> json) {
    return ResultBlogModel(
      results: json['results'] != null
          ? (json['results'] as List).map((i) => BlogModel.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BlogModel {
  final String? author, content, photo, subTitle, tag, title;
  final int? id, createAt;

  BlogModel(
      {this.author,
      this.content,
      this.createAt,
      this.id,
      this.photo,
      this.subTitle,
      this.tag,
      this.title});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      author: json['author'],
      content: json['content'],
      createAt: json['create_at'],
      id: json['id'],
      photo: json['photo'],
      subTitle: json['subTitle'],
      tag: json['tag'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['content'] = content;
    data['create_at'] = createAt;
    data['id'] = id;
    data['photo'] = photo;
    data['subTitle'] = subTitle;
    data['tag'] = tag;
    data['title'] = title;
    return data;
  }
}
