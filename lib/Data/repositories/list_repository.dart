import 'package:todo_app/Data/models/list_model.dart';

class ListRepository {
  //Listas
  final List<ListModel> _lists = [
    ListModel(id: 1, title: "Destacadas"),
    ListModel(id: 2, title: "Mis tareas"),
  ];

  //Regresa las listas
  Future<List<ListModel>> getLists() async {
    await Future.delayed(const Duration(milliseconds: 300)); //Simular red
    return _lists.toList();
  }

  //Agregar lista
  Future<void> addList(String title) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final id = (_lists.lastOrNull?.id ?? 0) + 1;
    final list = ListModel(id: id, title: title);
    _lists.add(list);
  }
}
