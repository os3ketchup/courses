// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sanexx/src/helpers/apptheme.dart';
// import 'package:sanexx/src/helpers/widgets.dart';
// import 'package:sanexx/src/ui/client/home/models/product.dart';
// import 'package:sanexx/src/ui/client/products/product.dart';
// import 'package:sanexx/src/ui/client/products/provider.dart';
// import 'package:sanexx/src/ui/client/products/widgets/products_item_widget.dart';
// import 'package:sanexx/src/variables/icons.dart';
// import 'package:sanexx/src/variables/keys.dart';
// import 'package:sanexx/src/variables/language.dart';
// import 'package:sanexx/src/variables/util_variables.dart';
//
// // ignore: must_be_immutable
// class Products extends StatelessWidget {
//   final Function onNavigate;
//   List<ProductModel>? data;
//   bool canScroll;
//
//   Products({
//     super.key,
//     this.data,
//     this.canScroll = true,
//     required this.onNavigate,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, ref, child) {
  //       final notifier = ref.watch(productProvider);
//       if (data == null || canScroll) {
//         data = notifier.products;
//       }
//       if (notifier.products.isEmpty) {
//         return Container(
//           height: 400.h,
//           width: 600.w,
//           alignment: Alignment.center,
//           child: notifier.isLoading
//               ? CircularProgressIndicator(
//                   backgroundColor: theme.blue,
//                 )
//               : Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset(
//                       SvgIcon.folderSearch,
//                       width: 60.o,
//                       height: 60.o,
//                       colorFilter: theme.greyFilter,
//                     ),
//                     SizedBox(
//                       height: 10.o,
//                     ),
//                     Text(
//                       noInformation.tr,
//                       maxLines: 2,
//                       style: theme.textStyle.copyWith(
//                         fontSize: 20.o,
//                         color: theme.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//         );
//       }
//       return NotificationListener<ScrollNotification>(
//         onNotification: (scrollNotification) {
//           if (scrollNotification.metrics.pixels >=
//               scrollNotification.metrics.maxScrollExtent - 100.o) {
//             notifier.getProducts();
//           }
//           return true;
//         },
//         child: GridView.builder(
//           shrinkWrap: true,
//           padding: EdgeInsets.all(12.o),
//           itemCount: data!.length,
//           physics: canScroll ? null : const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 290.w,
//             mainAxisExtent: 440.w,
//           ),
//           itemBuilder: (_, index) {
//             final itemCount = notifier.checkProduct(data![index].id);
//             bool isHave = itemCount != null;
//             return ProductsItemWidget(
//               index: index,
//               count: '$itemCount',
//               image: data![index].img,
//               title: data![index].name,
//               price: '${data![index].price}',
//               isActive: isHave,
//               imageTap: (controller) => push(
//                 context,
//                 Product(
//                   data![index],
//                   tag: index,
//                   countController: controller,
//                   onNavigate: onNavigate,
//                 ),
//               ),
//               cartTap: () {
//                 onNavigate();
//               },
//               onEdit: (GlobalKey widgetKey, count) async {
//                 if (count <= 0) {
//                   notifier.deleteSelectedProduct(data![index]);
//                   return;
//                 }
//                 if (count > (itemCount ?? 0)) {
//                   addToCartAnimation(widgetKey);
//                 }
//                 notifier.setSelectedProduct(
//                     data![index].copyWith(itemCount: count));
//               },
//             );
//           },
//         ),
//       );
//     });
//   }
// }
