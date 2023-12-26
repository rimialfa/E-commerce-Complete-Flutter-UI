import 'package:app/services/models.dart';
import 'package:flutter/material.dart';

import '../../../components/product_card.dart';
import '../../details/details_screen.dart';
import '../../products/products_screen.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({required this.projects, super.key});

  final List<dynamic> projects;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "New Projects",
            press: () {
              Navigator.pushNamed(context, ProductsScreen.routeName);
            },
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: projects
                  .map(
                    (project) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ProductCard(
                        project: project,
                        onPress: () => (
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments:
                                ProductDetailsArguments(project: project),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()
              // [
              //   ...List.generate(
              //     projects.length,
              //     (index) {
              //       // if (demoProducts[index].isPopular) {
              //       return Padding(
              //         padding: const EdgeInsets.only(left: 20),
              //         child: ProductCard(
              //             product: projects[index], onPress: () => ()
              //             // () => Navigator.pushNamed(
              //             //   context,
              //             //   DetailsScreen.routeName,
              //             //   arguments:
              //             //       ProductDetailsArguments(product: products[index]),
              //             // ),
              //             ),
              //       );
              //       // }

              //       // return const SizedBox
              //       //     .shrink(); // here by default width and height is 0
              //     },
              //   ),
              //   const SizedBox(width: 20),
              // ],
              ),
        )
      ],
    );
  }
}
