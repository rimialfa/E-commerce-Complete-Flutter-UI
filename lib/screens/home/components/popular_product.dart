import 'package:app/screens/details/course_info_screen.dart';
import 'package:app/screens/home/components/project_list_view.dart';
import 'package:app/services/models.dart';
import 'package:flutter/material.dart';

import '../../../components/product_card.dart';
import '../../details/details_screen.dart';
import '../../products/products_screen.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({required this.projects, super.key});

  final List<dynamic> projects;

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.projects.length,
      padding: const EdgeInsets.only(top: 8),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final int count =
            widget.projects.length > 10 ? 10 : widget.projects.length;
        final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
                parent: animationController!,
                curve: Interval((1 / count) * index, 1.0,
                    curve: Curves.fastOutSlowIn)));
        animationController?.forward();
        return ProjectListView(
          project: widget.projects[index],
          animation: animation,
          animationController: animationController!,
        );
      },
    );
  }
}
