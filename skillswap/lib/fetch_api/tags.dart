// fetch tags
import 'dart:convert';

import '../api_models/banner_tag.dart';
import '../utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

Future<List<Tag>> fetchTags() async {
  final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.listTagsEndpoint}'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((tag) => Tag.fromJson(tag)).toList();
  } else {
    throw Exception('Failed to load tags');
  }
}