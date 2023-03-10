class QuestionModel{
  QuestionModel({
    required this.title,
    required this.answer,
  });
  late final String title;
  late final String answer;

  QuestionModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? '';
    answer = json['answer'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'answer': answer,
    };
  }
}

