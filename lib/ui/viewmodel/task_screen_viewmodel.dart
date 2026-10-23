import 'package:flutter/material.dart';
import 'package:todo_app/Data/models/list_model.dart';
import 'package:todo_app/Data/repositories/list_repository.dart';

class TaskScreenViewmodel extends ChangeNotifier {
  //Estado
  List<ListModel> lists = [];
  final ListRepository _listRepository;
  bool isLoading = false;

  TaskScreenViewmodel(this._listRepository);

  //Carga todas las listas iniciales
  Future<void> loadLists() async {
    isLoading = true;

    try {
      lists = await _listRepository.getLists();
    } catch (e) {
      print("Error al cargar las listas");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //Agregar lista
  Future<void> addList(String title) async {
    final clean = title.trim();
    if (clean.isEmpty) {
      print("Error al cargar");
      notifyListeners();
      return;
    }
    await _listRepository.addList(clean);
    await loadLists();
  }
}
