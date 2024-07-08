class Category {
  final String title;
  final String photo;
  Category({
    required this.title,
    required this.photo
  });
}

class ServiceModel {
  final String name;
  final String price;
  final String category;
  ServiceModel({
    required this.name,
    required this.price,
    required this.category
  });
  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "category": category,
    };
  }
  factory ServiceModel.fromJson(Map<String,dynamic> json) {
    return ServiceModel(name: json['name'], price: json['price'],category: json['category']);
  }
}

List<Category> categories = [
  Category(title: "Jardineria", photo: "assets/images/jardinero.png"),
  Category(title: "Plomero", photo: "assets/images/plomero.png"),
  Category(title: "Contador", photo: "assets/images/trabajoremoto.png"),
];

List<ServiceModel> services = [
  ServiceModel(name: "Matias Altamirano", price: "20.000 clp",category: "Jardineria"),
  ServiceModel(name: "Emilio Altamirano", price: "21.000 clp",category: "Jardineria"),
  ServiceModel(name: "Stefanie Altamirano", price: "40.000 clp",category: "Servicios financieros"),
];