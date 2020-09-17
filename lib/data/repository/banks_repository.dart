import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:glade_tests/data/model/banks.dart';
import 'package:glade_tests/data/networking/bank_list_helper.dart';

final BankListHelper _bankListHelper = BankListHelper();

class BanksListRepository {
  Future<List<Banks>> getBankList({@required String url, @required Map body}) async {
    final _response = await _bankListHelper.get(url: url, map: body);
    print('_response $_response');
      return _response;

  }
}