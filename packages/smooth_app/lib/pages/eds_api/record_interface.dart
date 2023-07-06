

class RecordObj {
  DateTime date;
  double symptom1;

  RecordObj({
    required this.date,
    required this.symptom1
  });

  RecordObj.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        symptom1 = json['symptom1'];

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'symptom1': symptom1,
      };
}