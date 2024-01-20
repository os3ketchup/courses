import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client.dart';
import '../http_result.dart';
import '../variables/links.dart';

ChangeNotifierProvider<SaleNotifier> saleProvider =
    ChangeNotifierProvider<SaleNotifier>((ref) {
  return saleNotifier;
});

SaleNotifier? _saleNotifier;

SaleNotifier get saleNotifier {
  _saleNotifier ??= SaleNotifier();
  return _saleNotifier!;
}

class SaleNotifier with ChangeNotifier {
  SaleNotifier() {
    // register();
  }

  List<PersonModel> users = [];
  List<PersonModel> clients = [];
  List<PersonModel> sales = [];
  bool isCreating = false;
  bool clientLoading = true;
  bool saleLoading = true;
  bool isClient = true;
  String lastTxt = '';

  void update() {
    notifyListeners();
  }

  void register(String phone) async {
    MainModel result = await client.post('/auth/register/phone', data: {
      'phone': phone,
      'signature': '+998999156905',
    });
  }

  void verify(String phone,String verificationCode) async {
    MainModel verify = await client.post('/auth/register/verify', data: {
      'phone':phone,
      'code':verificationCode,
    });
  }

  void signUp(String name, String lastName,String code,String phone,String password,String passwordRepeat) async {
    MainModel verify = await client.post('/auth/register/sign-up', data: {
      'firstname':name,
      'lastname':lastName,
      'code':code,
      'phone':phone,
      'password':password,
      'password_repeat':passwordRepeat,
    });
  }


  void getClients() async {
    clientLoading = true;
    MainModel result = await client.post('/auth/register/sign-up');
    clientLoading = false;
    if (result.status == 200 && result.data is List) {
      clients = List<PersonModel>.from(
          result.data.map((x) => PersonModel.fromJson(x)));
      if (isClient) {
        users.addAll(clients);
      }
      notifyListeners();
    } else {
      notifyListeners();
      return Future.error(result.message);
    }
  }

  void resetFilter(bool byClient) {
    isClient = byClient;
    users.clear();
    if (isClient) {
      users.addAll(clients);
    } else {
      users.addAll(sales);
    }
    notifyListeners();
  }

  void filter(String txt) {
    users.clear();
    print(txt);
    print('clients: ${clients.length}');
    print('sales: ${sales.length}');
    for (final item in isClient ? clients : sales) {
      print(item.name);
      if (item.name.toLowerCase().contains(txt.toLowerCase())) {
        users.add(item);
      }
    }
    notifyListeners();
  }
}

class PersonModel {
  PersonModel({
    this.id = '',
    this.name = '',
  });

  String id;
  String name;

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        id: json['id'].toString(),
        name:
            json['name'] is String ? json['name'] : json['fullname'].toString(),
      );
}
