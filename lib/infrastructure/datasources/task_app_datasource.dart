import 'package:dio/dio.dart';
import 'package:todo_app/infrastructure/models/lista_response_dto.dart';

class TaskAppDatasource {
  //Objeto DIO General
  final dio = Dio(
    //Propiedades definidas por defecto
    BaseOptions(
      //URL base de las peticiones
      baseUrl: 'http://192.168.3.3:8080/index.php',
      //Parametors de la petición
    ),
  );

  Future<List<ListaResponseDto>> getListas() async {
    try {
      final response = await dio.get(
        '',
        queryParameters: {'r': 'api/listas'},
      );
      print('Status: ${response.statusCode}');
      print('Raw response.data: ${response.data}');

      final data = response.data;

      if (data is List) {
        final listas = data
            .map<ListaResponseDto>(
              (e) => ListaResponseDto.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        print('Parsed listas: $listas');
        return listas;
      }

      if (data is Map<String, dynamic>) {
        // Si el backend devuelve un objeto único
        final single = ListaResponseDto.fromJson(data);
        print('Parsed single: $single');
        return [single];
      }

      throw Exception('Formato de respuesta inesperado: ${data.runtimeType}');
    } catch (e, st) {
      print('Error al obtener listas: $e');
      print(st);
      rethrow;
    }
  }
}
