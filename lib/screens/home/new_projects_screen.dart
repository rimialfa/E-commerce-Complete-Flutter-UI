import 'package:app/screens/home/components/popular_product.dart';
import 'package:app/screens/shared/error.dart';
import 'package:app/screens/shared/loading.dart';
import 'package:app/services/project.dart';
import 'package:flutter/material.dart';

class NewProjectsScreen extends StatelessWidget {
  const NewProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProjectService().getNewProjects(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: ErrorMessage(message: snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            var projects = snapshot.data!;
            return Expanded(child: PopularProducts(projects: projects));
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: LoadingScreen(),
            );
          }
        });
  }
}
