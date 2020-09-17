import 'package:flutter/cupertino.dart';
import 'package:glade_tests/data/appState/app_state.dart';
import 'package:glade_tests/data/model/account_name.dart';
import 'package:glade_tests/data/repository/accnt_name_repository.dart';

class AccntNameState extends AppState {

  final AccntNameRepository _accntNameRepository = AccntNameRepository();

  Future<AccountName> verifyAccountNumber(
      {@required String path, Map body}) async {
    return await _accntNameRepository.validateAccountName(url: path, body: body);
  }
}