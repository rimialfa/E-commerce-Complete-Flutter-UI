import 'package:app/services/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProjectService {
  Future<List<dynamic>> getNewProjects() async {
    const url = 'http://10.0.2.2:8000/api/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final data = json['data'];
    final projects = data.map((d) => Project.fromJson(d));

    return projects.toList();
  }
}
