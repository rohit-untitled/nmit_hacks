import 'dart:convert';

import '../api_models/educator_list.dart';
import '../utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;


// fetch educators
Future<List<Educator>> fetchEducators() async {
  final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.listEducatorEndpoint}'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((educator) => Educator.fromJson(educator)).toList();
  } else {
    throw Exception('Failed to load educators');
  }
}
