import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glade_tests/data/model/banks.dart';
import 'package:glade_tests/domain/usecases/accnt_name_state.dart';
import 'package:glade_tests/domain/usecases/bank_list_state.dart';
import 'package:glade_tests/domain/usecases/bvn_state.dart';
import 'package:glade_tests/utils/custom_loader_indicator.dart';
import 'package:glade_tests/utils/custom_widget.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _accntNumberController = TextEditingController();
  TextEditingController _bvnController = TextEditingController();
  List<Banks> _bankList = [];
  Banks _bank;
  BankListState _bankListState;
  AccntNameState _accntNameState;
  BvnState _bvnState;
  CustomLoader _loader;
  final _logger = Logger();
  //SharedPreferencesHelper _helper = SharedPreferencesHelper();



  @override
  void initState() {
    _bankListState = Provider.of<BankListState>(context, listen: false);
    _accntNameState = Provider.of<AccntNameState>(context, listen: false);
    _bvnState = Provider.of<BvnState>(context, listen: false);
    _loader = CustomLoader(context);
    _fetchAllBanks();
    super.initState();
  }

  @override
  void dispose() {
    _accntNumberController.dispose();
    _bvnController.dispose();
    super.dispose();
  }


  TextStyle style = TextStyle(
    color: Colors.black,
    fontSize: 20,
  );

  _fetchAllBanks() {
    _loader.showLoader();
    Map _map = Map<String, dynamic>();
    String body = 'banks';
    _map['inquire'] = body;

    _bankListState.getAllBanks(path: 'resources', body: _map).then((value){
      _loader.hideLoader().then((_){
        setState(() {
          print('Bank name ${value}');

        /*  for(final item in value.name[0]){
            //_bankList.add(item);
            print('Bank name ${item}');

          }*/
        //  _bankList = value.name as List<Banks>;
        });
      });
    }).catchError((err){
      _loader.hideLoader();
      _logger.e('Error: $err');
    });
  }


  _verifyAccountNumber(){
    _loader.showLoader();
    Map _map = Map<String, dynamic>();
    String body = 'accountname';
    _map['inquire'] = body;
    _map['accountnumber'] = _accntNumberController.text;
    _map['bankcode'] = '058';

    _accntNameState.verifyAccountNumber(path: 'resources', body: _map).then((value){
      _loader.hideLoader().then((_){
        setState(() {
          customSnackBar(_scaffoldKey, '${value.status}');
          print('Account Number Status ${value.status}');
        });
      });
    }).catchError((err){
      _loader.hideLoader();
      _logger.e('Error: $err');
      customSnackBar(_scaffoldKey, '${err}');

    });
  }

  _verifyBvn(){
    _loader.showLoader();
    Map _map = Map<String, dynamic>();
    String body = 'bvn';
    _map['inquire'] = body;
    _map['bvn'] = _bvnController.text;

    _bvnState.validateBvn(path: 'resources', body: _map).then((value){
      _loader.hideLoader().then((_){
        setState(() {
          print('Bvn Status${value.status}');
          customSnackBar(_scaffoldKey, '${value.status}');

        });
      });
    }).catchError((err){
      _loader.hideLoader();
      _logger.e('Error: $err');
      customSnackBar(_scaffoldKey, '${err}');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text('Welcome',textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 40, fontFamily: 'Varela',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 80),
             // _supportedBanks(),
              SizedBox(height: 20),
              _accountNumberField(),
              SizedBox(height: 20),
              _bvnField()
            ],
          ),
        ),
      ),
    );
  }

  Widget _supportedBanks(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          child: DropdownButton<Banks>(
            value: _bank,
            hint: Text('Banks'),
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down),
            onChanged: (value) {
              setState(() => _bank = value);
            },
            items: _bankList.map((result) {
              return DropdownMenuItem<Banks>(
                value: result,
                child: Text(
                  result.name,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _accountNumberField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextFormField(
        onChanged: (text){
          if(text.length == 10){
            _verifyAccountNumber();
          }
        },
        key: Key("Account Number"),
        keyboardType: TextInputType.number,
        style: style,
        controller: _accntNumberController,
        cursorColor: Colors.black,
        decoration: new InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          labelText: "Account Number",
          labelStyle: TextStyle(color: Colors.grey,fontFamily: 'Varela',),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                  color: Colors.grey, width: 2.0, style: BorderStyle.solid)),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        ),
      ),
    );
  }

  Widget _bvnField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextFormField(
        onChanged: (text){
          if(text.length == 11){
            _verifyBvn();
          }
        },
        key: Key("Bvn"),
        keyboardType: TextInputType.number,
        style: style,
        controller: _bvnController,
        cursorColor: Colors.black,
        decoration: new InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          labelText: "Bvn",
          labelStyle: TextStyle(color: Colors.grey,fontFamily: 'Varela',),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                  color: Colors.grey, width: 2.0, style: BorderStyle.solid)),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        ),
      ),
    );
  }




}
