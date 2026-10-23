class ListModel {
  final int id;
  final String title;

  ListModel({required this.id, required this.title});

  ListModel copywith({int? id, String? title}) {
    return ListModel(id: id ?? this.id, title: title ?? this.title);
  }
}
