
class ServiceProvider {
  final String id;
  final String name;
  final String? photo;
  final String? phone;
  final String? address;
  final String? email;
  List<String> completedJobs; // guardo los id de los trabajos completados
  List<String> occupaton; // id de las ocupaciones

  ServiceProvider({
    required this.id,
    required this.name,
    this.photo,
    this.phone,
    this.email,
    this.address,
    this.completedJobs = const [],
    this.occupaton = const [],
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "photo": photo ?? "",
      "phone": phone ?? "",
      "address": address ?? "",
      "email": email
    };
  }
  factory ServiceProvider.fromJson(Map<String,dynamic> json) {
    return ServiceProvider(
      id: json['id'], 
      name: json['name'], 
      email: json['email']
    );
  }
}