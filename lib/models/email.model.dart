class ResultEmailModel {
    final List<EmailModel>? results;
    final bool status;
    final String? message;
    ResultEmailModel({this.results, this.status = true, this.message});

    factory ResultEmailModel.fromJson(Map<String, dynamic> json) {
        return ResultEmailModel(
            results: json['results'] != null ? (json['results'] as List).map((i) => EmailModel.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data =  <String, dynamic>{};
        if (results != null) {
            data['results'] = results!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class EmailModel {
    String? email, phone;
    int? id;

    EmailModel({this.email, this.id, this.phone});

    factory EmailModel.fromJson(Map<String, dynamic> json) {
        return EmailModel(
            email: json['email'],
            id: json['id'],
            phone: json['phone'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['email'] = email;
        data['id'] = id;
        data['phone'] = phone;
        return data;
    }
}