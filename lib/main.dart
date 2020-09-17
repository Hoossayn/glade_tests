import 'package:flutter/material.dart';
import 'package:glade_tests/domain/usecases/bvn_state.dart';
import 'package:glade_tests/presentation/home_page.dart';
import 'package:provider/provider.dart';
import 'data/appState/app_state.dart';
import 'domain/usecases/accnt_name_state.dart';
import 'domain/usecases/bank_list_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
        ChangeNotifierProvider<BankListState>(create: (_) => BankListState()),
        ChangeNotifierProvider<BvnState>(create: (_) => BvnState()),
        ChangeNotifierProvider<AccntNameState>(create: (_) => AccntNameState()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    ),
    );
  }
}
