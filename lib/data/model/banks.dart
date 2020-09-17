class Banks {
  String code;
  String name;

  Banks({this.code,
        this.name});


  @override
  String toString()=> "$runtimeType($code, $name)";

 /* Banks.fromJson(String code, String name)
      : code = code,
        name = name[0];*/

  factory Banks.fromJson(dynamic json) {
   return Banks(
       code : json['code'],
       name : json['name']
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.code;
    data['value'] = this.name;
    return data;
  }
}
