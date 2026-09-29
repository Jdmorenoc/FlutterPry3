class DbzModel {
  final int id;
  final String name;
  final String ki;

  const DbzModel({required this.id, required this.name, required this.ki});

  factory DbzModel.fromJson(Map<String, dynamic> json) {
    return DbzModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      ki: json['ki'] ?? '',
    );
  }
}
