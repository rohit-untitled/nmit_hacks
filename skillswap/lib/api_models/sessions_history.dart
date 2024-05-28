// lib/session_history.dart
class SessionHistory {
  final int id;
  final List<String> tagNames;
  final String duration;
  final String price;
  final String problemDescription;
  final String sessionStatus;
  final String paymentStatus;
  final int learner;
  final int educator;
  final List<int> tags;

  SessionHistory({
    required this.id,
    required this.tagNames,
    required this.duration,
    required this.price,
    required this.problemDescription,
    required this.sessionStatus,
    required this.paymentStatus,
    required this.learner,
    required this.educator,
    required this.tags,
  });

  factory SessionHistory.fromJson(Map<String, dynamic> json) {
    return SessionHistory(
      id: json['id'],
      tagNames: List<String>.from(json['tag_names']),
      duration: json['duration'],
      price: json['price'],
      problemDescription: json['problem_description'],
      sessionStatus: json['session_status'],
      paymentStatus: json['payment_status'],
      learner: json['learner'],
      educator: json['educator'],
      tags: List<int>.from(json['tags']),
    );
  }
}
