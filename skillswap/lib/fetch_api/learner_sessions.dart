import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_models/sessions_list.dart';
import '../utils/constants/api_constants.dart';

Future<List<Session>> fetchLearnerSessions(
    String username, String password) async {
  const String url = ApiConstants.baseUrl + ApiConstants.sessionsEndpoint;
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$username:$password'))}',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> sessionsData = responseData['sessions'];
    return sessionsData.map((item) => Session.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load sessions');
  }
}
