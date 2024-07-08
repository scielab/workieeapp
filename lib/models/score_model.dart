
class ScoreModel {
  final String iduser;
  final double score;
  final int ammount;
  final DateTime date;

  ScoreModel({
    required this.iduser,
    this.score = 0.0,
    this.ammount = 0,
    DateTime? date,  
  }) : date =  date ?? DateTime.now();
  
  Map<String, dynamic> toMap() {
    return {
      "iduser": iduser,
      "score": score,
      "ammount": ammount,
      "date": date
    };
  }
  factory ScoreModel.fromJson(Map<String,dynamic> json) {
    return ScoreModel(
      iduser: json['iduser'],
      score: json['score'],
      ammount: json['ammount'],
      date: json['date'],
    );
  }
}

ScoreModel scoreModel = ScoreModel(iduser: "1");