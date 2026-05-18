import 'package:flutter/material.dart';
import 'package:todo_app/infrastructure/datasources/Task_app_datasource.dart';
import 'package:todo_app/presentation/screens/Task_screen.dart';

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
}
