import 'package:app/services/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.project,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Project project;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            project.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Card(
          elevation: 3,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Icon(Icons.location_pin),
                title: Text('Kuwait'),
              ),
            ],
          ),
        ),
        Card(
          elevation: 3,
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(Icons.description),
                title: Text(project.description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'MORE',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
