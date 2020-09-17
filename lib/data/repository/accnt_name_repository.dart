import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:glade_tests/data/model/account_name.dart';
import 'package:glade_tests/data/networking/account_name_helper.dart';

final AccountNameHelper _accntNameHelper = AccountNameHelper();

class AccntNameRepository {
  Future<AccountName> validateAccountName({@required String url, @required Map body}) async {
    final _response = await _accntNameHelper.get(url: url, map: body);
    return AccountName.fromJson(json.decode(json.encode(_response)));
  }
}