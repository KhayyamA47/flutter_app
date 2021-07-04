class Options {
  int code;
  List<Data> data;

  Options({this.code, this.data});

  Options.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String placeName;
  String path;
  String address;

  Data({this.id, this.placeName, this.path, this.address});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeName = json['placeName'];
    path = json['path'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['placeName'] = this.placeName;
    data['path'] = this.path;
    data['address'] = this.address;
    return data;
  }
}
