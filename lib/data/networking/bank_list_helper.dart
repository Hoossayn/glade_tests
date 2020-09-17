import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:glade_tests/data/model/banks.dart';
import 'package:glade_tests/utils/commons.dart';
import 'package:glade_tests/utils/exception_handling.dart';
import 'package:glade_tests/utils/exceptions.dart';
import 'package:http/http.dart' as http;

class BankListHelper{
  Future<dynamic> get({@required String url, Map map}) async {
    List<Banks> responseJson;
    String _url = '${StringRes.BASE_URL}$url';
    try {
      final response =
      await http.put(_url, headers:
      {
        'Content-Type': 'application/json',
        'mid': 'GP0000001',
        'key': '123456789'
      },
        body: jsonEncode(map),
      ).timeout(Duration(seconds: 15));
      Map<String, dynamic> mapResponse = json.decode(response.body);

      List<Banks> bankList = List();
      var mapBanks = mapResponse.keys;

      for(final key in mapBanks){
        var banks = Banks(code: key, name: mapResponse[key]);
        bankList.add(banks);
      //  responseJson = bankList;

      }

      responseJson = bankList; //returnResponse(response);


    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    print(' response.json ${responseJson.toString()}');
    return responseJson;
  }
}