import 'dart:ui';

import 'package:app/components/project_stats.dart';
import 'package:app/constants.dart';
import 'package:app/services/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'design_course_app_theme.dart';

class ProjectDetailScreen extends StatelessWidget {
  static String routeName = "/details";
  ProjectDetailScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            ProjectDetailAppBar(image: agrs.project.image, id: agrs.project.id),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        agrs.project.name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.5,
                          color: kMainTextColor,
                        ),
                      ),
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: kPrimaryColor,
                        ),
                        const Gap(4),
                        Text(
                          agrs.project.country,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    const Gap(16),
                    ProjectStats(
                      project: agrs.project,
                    ),
                    const Gap(16),
                    const Divider(
                      color: kOutlineColor,
                      height: 1.0,
                    ),
                    const Gap(32),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              labelText: "Enter Donation Amount",
                              labelStyle: const TextStyle(color: kPrimaryColor),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide:
                                    const BorderSide(color: kOutlineColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide:
                                    const BorderSide(color: kPrimaryColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter amount';
                              }
                              return null;
                            },
                          ),
                          const Gap(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: DesignCourseAppTheme.nearlyWhite,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                    border: Border.all(
                                        color: kPrimaryColor.withOpacity(0.5)),
                                  ),
                                  child: const Icon(
                                    Icons.shopping_cart,
                                    color: kPrimaryColor,
                                    size: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Flexible(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate()) {
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Donate Now',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(32),
                    const Divider(
                      color: kOutlineColor,
                      height: 1.0,
                    ),
                    const Gap(16),
                    const Text(
                      "Project Description:",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: 0.27,
                        color: DesignCourseAppTheme.grey,
                      ),
                      // maxLines: 3,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(10),
                    Card(
                      surfaceTintColor: Colors.white,
                      margin: EdgeInsets.zero,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          agrs.project.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            letterSpacing: 0.27,
                            color: DesignCourseAppTheme.grey,
                          ),
                          // maxLines: 3,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Gap(16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Project project;
  ProductDetailsArguments({required this.project});
}

class ProjectDetailAppBar extends StatelessWidget {
  const ProjectDetailAppBar({super.key, required this.image, required this.id});

  final String image;
  final int id;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: 200.0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: id,
          child: Image.network(image, fit: BoxFit.cover),
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      leadingWidth: 80.0,
      leading: Container(
        padding: const EdgeInsets.only(left: 24.0),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(56.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                width: 56.0,
                height: 56.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.7)),
                child: SvgPicture.asset(
                    'assets/icons/arrow-ios-back-outline.svg',
                    fit: BoxFit.scaleDown),
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32.0,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Container(
            width: 40.0,
            height: 5.0,
            decoration: BoxDecoration(
              color: kOutlineColor,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),
    );
  }
}
