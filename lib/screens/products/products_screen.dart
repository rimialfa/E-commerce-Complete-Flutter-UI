import 'package:app/services/models.dart';
import 'package:flutter/material.dart';
import 'package:app/components/product_card.dart';
import 'package:app/models/Product.dart';

import '../details/details_screen.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  static String routeName = "/products";
  final List<Project> projects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Products"),
        // ),
        // body: SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16),
        //     child: GridView.builder(
        //       itemCount: demoProducts.length,
        //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //         maxCrossAxisExtent: 200,
        //         childAspectRatio: 0.7,
        //         mainAxisSpacing: 20,
        //         crossAxisSpacing: 16,
        //       ),
        //       itemBuilder: (context, index) => ProductCard(
        //         project: projects[index],
        //         onPress: () => Navigator.pushNamed(
        //           context,
        //           DetailsScreen.routeName,
        //           arguments: ProductDetailsArguments(project: []),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
