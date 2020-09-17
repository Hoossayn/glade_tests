class Bvn {
  String status;
  Data data;

  Bvn({this.status, this.data});

  Bvn.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String firstname;
  String lastname;
  String dob;
  String bvn;
  String phone;

  Data({this.firstname, this.lastname, this.dob, this.bvn, this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    dob = json['dob'];
    bvn = json['bvn'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['dob'] = this.dob;
    data['bvn'] = this.bvn;
    data['phone'] = this.phone;
    return data;
  }
}