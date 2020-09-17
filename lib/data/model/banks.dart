/*
import 'package:json_annotation/json_annotation.dart';
part 'banks.g.dart';

@JsonSerializable()
class Banks extends Object with _$BanksSerializerMixin {
  Banks(
      {this.s101,
        this.s214,
        this.s215,
        this.s221,
        this.s232,
        this.s301,
        this.s304,
        this.s305,
        this.s307,
        this.s309,
        this.s311,
        this.s315,
        this.s322,
        this.s323,
        this.s401,
        this.s601,
        this.s044,
        this.s014,
        this.s063,
        this.s050,
        this.s084,
        this.s070,
        this.s011,
        this.s058,
        this.s030,
        this.s082,
        this.s076,
        this.s068,
        this.s032,
        this.s033,
        this.s035,
        this.s057});

  String s101;
  String s214;
  String s215;
  String s221;
  String s232;
  String s301;
  String s304;
  String s305;
  String s307;
  String s309;
  String s311;
  String s315;
  String s322;
  String s323;
  String s401;
  String s601;
  String s044;
  String s014;
  String s063;
  String s050;
  String s084;
  String s070;
  String s011;
  String s058;
  String s030;
  String s082;
  String s076;
  String s068;
  String s032;
  String s033;
  String s035;
  String s057;

  factory Banks.fromJson(Map<String, dynamic> json) => _$BanksSerializerMixin(json);


*/
/*  Banks.fromJson(Map<String, dynamic> json) {
    s101 = json['101'];
    s214 = json['214'];
    s215 = json['215'];
    s221 = json['221'];
    s232 = json['232'];
    s301 = json['301'];
    s304 = json['304'];
    s305 = json['305'];
    s307 = json['307'];
    s309 = json['309'];
    s311 = json['311'];
    s315 = json['315'];
    s322 = json['322'];
    s323 = json['323'];
    s401 = json['401'];
    s601 = json['601'];
    s044 = json['044'];
    s014 = json['014'];
    s063 = json['063'];
    s050 = json['050'];
    s084 = json['084'];
    s070 = json['070'];
    s011 = json['011'];
    s058 = json['058'];
    s030 = json['030'];
    s082 = json['082'];
    s076 = json['076'];
    s068 = json['068'];
    s032 = json['032'];
    s033 = json['033'];
    s035 = json['035'];
    s057 = json['057'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['101'] = this.s101;
    data['214'] = this.s214;
    data['215'] = this.s215;
    data['221'] = this.s221;
    data['232'] = this.s232;
    data['301'] = this.s301;
    data['304'] = this.s304;
    data['305'] = this.s305;
    data['307'] = this.s307;
    data['309'] = this.s309;
    data['311'] = this.s311;
    data['315'] = this.s315;
    data['322'] = this.s322;
    data['323'] = this.s323;
    data['401'] = this.s401;
    data['601'] = this.s601;
    data['044'] = this.s044;
    data['014'] = this.s014;
    data['063'] = this.s063;
    data['050'] = this.s050;
    data['084'] = this.s084;
    data['070'] = this.s070;
    data['011'] = this.s011;
    data['058'] = this.s058;
    data['030'] = this.s030;
    data['082'] = this.s082;
    data['076'] = this.s076;
    data['068'] = this.s068;
    data['032'] = this.s032;
    data['033'] = this.s033;
    data['035'] = this.s035;
    data['057'] = this.s057;
    return data;
  }*//*

}

*/


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
