class Session {
  final int id;
  final String duration;
  final String price;
  final String problemDescription;
  final String sessionStatus;
  final String paymentStatus;
  final String learner;
  final String educator;
  final List<String> tags;

  Session({
    required this.id,
    required this.duration,
    required this.price,
    required this.problemDescription,
    required this.sessionStatus,
    required this.paymentStatus,
    required this.learner,
    required this.educator,
    required this.tags,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      duration: json['duration'],
      price: json['price'],
      problemDescription: json['problem_description'],
      sessionStatus: json['session_status'],
      paymentStatus: json['payment_status'],
      learner: json['learner'],
      educator: json['educator'],
      tags: List<String>.from(json['tags']),
    );
  }
}
