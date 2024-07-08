
class OccupationModel {
  final String id;
  final String title;
  final String description;
  OccupationModel({
    required this.id,
    required this.title,
    required this.description,
  });
  factory OccupationModel.fromJson(Map<String, dynamic> json) {
    return OccupationModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}