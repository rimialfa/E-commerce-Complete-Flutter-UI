import 'dart:convert';

import 'package:app/constants.dart';
import 'package:app/services/models.dart';
import 'package:flutter/material.dart';
import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/popular_product.dart';
import 'components/special_offers.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> projects = [];
  bool isLoaded = false;
  @override
  void initState() {
    getNewProjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HomeHeader(),
              DiscountBanner(),
              Categories(),
              SpecialOffers(),
              const SizedBox(height: 20),
              Visibility(
                  visible: isLoaded,
                  replacement: const Padding(
                    padding: EdgeInsets.only(top: 75),
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                  child: PopularProducts(projects: projects)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getNewProjects() async {
    const url = 'http://10.0.2.2:8000/api/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final data = json['data'];
    // print(data);
    List<dynamic> p = data.map((d) => Project.fromJson(d)).toList();

    setState(() {
      projects = p;
      isLoaded = true;
    });
  }
}
