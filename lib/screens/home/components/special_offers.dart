import 'package:flutter/material.dart';
import 'package:app/screens/products/products_screen.dart';
import 'package:gap/gap.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpecialOfferCard(
          image: "assets/images/ImageBanner2.jpg",
          category: "Widows",
          numOfBrands: 8,
          press: () {
            Navigator.pushNamed(context, ProductsScreen.routeName);
          },
        ),
        const Gap(16),
        SpecialOfferCard(
          image: "assets/images/ImageBanner3.jpg",
          category: "Orphans",
          numOfBrands: 12,
          press: () {
            Navigator.pushNamed(context, ProductsScreen.routeName);
          },
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(image, fit: BoxFit.cover),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black54,
                      Colors.black38,
                      Colors.black26,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "$category\n",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: "$numOfBrands projects")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
