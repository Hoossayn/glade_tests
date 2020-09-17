import 'package:flutter/cupertino.dart';
import 'package:glade_tests/data/appState/app_state.dart';
import 'package:glade_tests/data/model/bvn.dart';
import 'package:glade_tests/data/repository/bvn_repository.dart';

class BvnState extends AppState {

  final BvnRepository _bvnRepository = BvnRepository();
  Future<Bvn> validateBvn(
      {@required String path, Map body}) async {
    return await _bvnRepository.validateBvn(url: path, body: body);
  }
}
