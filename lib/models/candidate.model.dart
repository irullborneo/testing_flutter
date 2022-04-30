class CandidateModel {
    final int? id, birthday, expired;
    final String? gender, name,photo;
    CandidateModel({this.birthday, this.expired, this.gender, this.id, this.name, this.photo});

    factory CandidateModel.fromJson(Map<String, dynamic> json) {
        return CandidateModel(
            birthday: json['birthday'],
            expired: json['expired'],
            gender: json['gender'],
            id: json['id'],
            name: json['name'],
            photo: json['photo'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['birthday'] = birthday;
        data['expired'] = expired;
        data['gender'] = gender;
        data['id'] = id;
        data['name'] = name;
        data['photo'] = photo;
        return data;
    }
}

class ResultCandidateModel<T>{
  final List<CandidateModel>? results;
  final bool status;
  final String? message;
  ResultCandidateModel({this.results, this.status = true, this.message});

  factory ResultCandidateModel.fromJson(Map<String, dynamic> json) {
      return ResultCandidateModel(
          results: json['results'] != null ? (json['results'] as List).map((i) => CandidateModel.fromJson(i)).toList() : null,
      );
  }
}