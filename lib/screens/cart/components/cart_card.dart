import 'package:app/services/models.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(cartItem.project.image),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItem.project.name,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: "\KD${cartItem.amount}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      // text: " x${cart.numOfItem}",
                      text: " x1",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
