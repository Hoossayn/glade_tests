import 'package:flutter/cupertino.dart';
import 'package:glade_tests/data/appState/app_state.dart';
import 'package:glade_tests/data/model/banks.dart';
import 'package:glade_tests/data/repository/banks_repository.dart';

class BankListState extends AppState {

  final BanksListRepository _bankListRepository = BanksListRepository();

  Future<Banks> getAllBanks(
      {@required String path, Map body}) async {
    print('state_body $body');
    return await _bankListRepository.getBankList(url: path, body: body);
  }
}
