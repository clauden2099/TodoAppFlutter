import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Data/repositories/list_repository.dart';
import 'package:todo_app/ui/view/tasks_screen.dart';
import 'package:todo_app/ui/viewmodel/task_screen_viewmodel.dart';

/*
void main() async {
  final datasource = TaskAppDatasource();

  try {
    final listas = await datasource
        .getListas(); // ahora devuelve List<ListaResponseDto>
    for (var l in listas) {
      print('Lista: $l'); // usa toString() del DTO
      print('Titulo: ${l.titulo}');
      // si convertiste a DateTime:
      // print('Creada: ${l.createdAt.toIso8601String()}');
    }
  } catch (e, st) {
    print('Error al obtener listas: $e');
    print(st);
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}*/

void main() async {
  //Repositorios
  final listRepository = ListRepository();
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskScreenViewmodel(listRepository),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasksScreen(),
    );
  }
}
