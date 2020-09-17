class AccountName {
  String status;
  bool resolved;
  Data data;

  AccountName({this.status, this.resolved, this.data});

  AccountName.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resolved = json['resolved'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['resolved'] = this.resolved;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String accountName;

  Data({this.accountName});

  Data.fromJson(Map<String, dynamic> json) {
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_name'] = this.accountName;
    return data;
  }
}