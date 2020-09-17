import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:glade_tests/data/model/bvn.dart';
import 'package:glade_tests/data/networking/bvn_helper.dart';

final BvnHelper _bvnHelper = BvnHelper();

class BvnRepository {
  Future<Bvn> validateBvn({@required String url, @required Map body}) async {
    final _response = await _bvnHelper.get(url: url, map: body);
    return Bvn.fromJson(json.decode(json.encode(_response)));
  }
}