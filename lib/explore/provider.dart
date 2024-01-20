// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sanexx/src/network/client.dart';
// import 'package:sanexx/src/network/http_result.dart';
// import 'package:sanexx/src/variables/links.dart';
//
// ChangeNotifierProvider<SaleNotifier> saleProvider =
//     ChangeNotifierProvider<SaleNotifier>((ref) {
//   return saleNotifier;
// });
//
// SaleNotifier? _saleNotifier;
// SaleNotifier get saleNotifier {
//   _saleNotifier ??= SaleNotifier();
//   return _saleNotifier!;
// }
//
// class SaleNotifier with ChangeNotifier {
//   SaleNotifier() {
//     getClients();
//     getSalers();
//   }
//
//   List<PersonModel> users = [];
//   List<PersonModel> clients = [];
//   List<PersonModel> sales = [];
//   bool isCreating = false;
//   bool clientLoading = true;
//   bool saleLoading = true;
//   bool isClient = true;
//   String lastTxt = '';
//
//   void update() {
//     notifyListeners();
//   }
//
//   void getClients() async {
//     clientLoading = true;
//     MainModel result = await client.post(Links.orderClients);
//     clientLoading = false;
//     if (result.status == 200 && result.data is List) {
//       clients = List<PersonModel>.from(
//           result.data.map((x) => PersonModel.fromJson(x)));
//       if (isClient) {
//         users.addAll(clients);
//       }
//       notifyListeners();
//     } else {
//       notifyListeners();
//       return Future.error(result.message);
//     }
//   }
//
//   Future<void> createOrder(Map<String, dynamic> data) async {
//     if (!isCreating) {
//       isCreating = true;
//       notifyListeners();
//       MainModel result = await client.post(
//         Links.createOrder,
//         data: data,
//       );
//       isCreating = false;
//       notifyListeners();
//       if (result.status != 200) {
//         return Future.error(result.message);
//       }
//     }
//   }
//
//   void getSalers() async {
//     saleLoading = true;
//     MainModel result = await client.post(Links.orderSales);
//     saleLoading = false;
//     if (result.status == 200 && result.data is List) {
//       sales = List<PersonModel>.from(
//           result.data.map((x) => PersonModel.fromJson(x)));
//       if (!isClient) {
//         users.addAll(sales);
//       }
//       notifyListeners();
//     } else {
//       notifyListeners();
//       return Future.error(result.message);
//     }
//   }
//
//   void resetFilter(bool byClient) {
//     isClient = byClient;
//     users.clear();
//     if (isClient) {
//       users.addAll(clients);
//     } else {
//       users.addAll(sales);
//     }
//     notifyListeners();
//   }
//
//   void filter(String txt) {
//     users.clear();
//     print(txt);
//     print('clients: ${clients.length}');
//     print('sales: ${sales.length}');
//     for (final item in isClient ? clients : sales) {
//       print(item.name);
//       if (item.name.toLowerCase().contains(txt.toLowerCase())) {
//         users.add(item);
//       }
//     }
//     notifyListeners();
//   }
// }
//
// class PersonModel {
//   PersonModel({
//     this.id = '',
//     this.name = '',
//   });
//
//   String id;
//   String name;
//
//   factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
//         id: json['id'].toString(),
//         name:
//             json['name'] is String ? json['name'] : json['fullname'].toString(),
//       );
// }
