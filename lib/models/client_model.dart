class ClientModel {
  final String id;
  final String name;
  final String? photo;
  final String? address;

  ClientModel({
    required this.id,
    required this.name,
    this.photo,
    this.address,
  });
  
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "photo": photo ?? "",
      "address": address ?? "",
    };
  }
  factory ClientModel.fromJson(Map<String,dynamic> json) {
    return ClientModel(
      id: json['id'], 
      name: json['name'], 
      photo: json['photo'] ?? '',
      address: json['address'] ?? '',
    );
  }
}

ClientModel clientModel = ClientModel(
  id: '1', 
  name: "Matias", 
  address: "Satiago Steel 89 Coronel, Concepcion",
  photo: "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
);