class ResultAddressModel {
    final List<AddressModel>? results;
    final bool status;
    final String? message;
    ResultAddressModel({this.results, this.status = true, this.message});

    factory ResultAddressModel.fromJson(Map<String, dynamic> json) {
        return ResultAddressModel(
            results: json['results'] != null ? (json['results'] as List).map((i) => AddressModel.fromJson(i)).toList() : null,
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

class AddressModel {
    final String? address,city,state;
    final int? zipCode, id;

    AddressModel({this.address, this.city, this.id, this.state, this.zipCode});

    factory AddressModel.fromJson(Map<String, dynamic> json) {
        return AddressModel(
            address: json['address'],
            city: json['city'],
            id: json['id'],
            state: json['state'],
          zipCode: json['zip_code'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['address'] = address;
        data['city'] = city;
        data['id'] = id;
        data['state'] = state;
        data['zip_code'] = zipCode;
        return data;
    }
}