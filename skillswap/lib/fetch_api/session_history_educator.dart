// lib/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_models/sessions_history.dart';

Future<List<SessionHistory>> fetchSessionHistory(String username, String password) async {
  const String url = 'https://skillswap-jimz.onrender.com/session-history/'; 
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Basic ${base64Encode(utf8.encode('$username:$password'))}',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> sessionsHistoryData = responseData['completed_sessions'];
    return sessionsHistoryData.map((item) => SessionHistory.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load sessions');
  }
}
