class TempUserModel{
  TempUserModel({
    required this.date,
    required this.score,
  });
  late final String date;
  late final String score;

  TempUserModel.fromJson(Map<String, dynamic> json) {
    date = json['date'] ?? '';
    score = json['score'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'token': score,
    };
  }
}

