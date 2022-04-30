class ResultExperienceModel {
    final List<ExperienceModel>? results;
    final bool status;
    final String? message;
    ResultExperienceModel({this.results, this.status = true, this.message});

    factory ResultExperienceModel.fromJson(Map<String, dynamic> json) {
        return ResultExperienceModel(
            results: json['results'] != null ? (json['results'] as List).map((i) => ExperienceModel.fromJson(i)).toList() : null,
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

class ExperienceModel {
    String? industry, companyName,jobTitle, status;
    int? id;

    ExperienceModel({this.companyName, this.id, this.industry, this.jobTitle, this.status});

    factory ExperienceModel.fromJson(Map<String, dynamic> json) {
        return ExperienceModel(
          companyName: json['company_name'],
            id: json['id'],
            industry: json['industry'],
            jobTitle: json['job_title'],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['company_name'] = companyName;
        data['id'] = id;
        data['industry'] = industry;
        data['job_title'] = jobTitle;
        data['status'] = status;
        return data;
    }
}