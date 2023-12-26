import 'package:app/services/models.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: widget.project.id,
          child: Image.network(widget.project.image,
              width: MediaQuery.of(context).size.width),
        ),
        // SizedBox(
        //   width: 238,
        //   child: AspectRatio(
        //     aspectRatio: 1,
        //     child: Image.asset(widget.product.images[selectedImage]),
        //   ),
        // ),
        // SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ...List.generate(
        //       widget.product.images.length,
        //       (index) => SmallProductImage(
        //         isSelected: index == selectedImage,
        //         press: () {
        //           setState(() {
        //             selectedImage = index;
        //           });
        //         },
        //         image: widget.product.images[index],
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}

class SmallProductImage extends StatefulWidget {
  const SmallProductImage(
      {super.key,
      required this.isSelected,
      required this.press,
      required this.image});

  final bool isSelected;
  final VoidCallback press;
  final String image;

  @override
  State<SmallProductImage> createState() => _SmallProductImageState();
}

class _SmallProductImageState extends State<SmallProductImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(widget.isSelected ? 1 : 0)),
        ),
        child: Image.asset(widget.image),
      ),
    );
  }
}
