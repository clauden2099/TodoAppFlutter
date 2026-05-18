import 'package:flutter/material.dart';
import 'package:todo_app/infrastructure/datasources/task_app_datasource.dart';
import 'package:todo_app/presentation/widgets/Dialogo/dialogo_cuentas.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas'),
        centerTitle: true,
        elevation: 0,
        //backgroundColor: Colors.transparent, // O el color de fondo
        /*Con Inkwell se le da interactividad a un elemento estatico */
        /*leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {
              /*Esta es la función que muestra el dialogo en pantalla */
              showDialog(context: context, builder: (context) => DialogoCuentas());
            },
            /*Es un estilo definido para las imagenes para que tengan un estilo Circular */
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/16361358?v=4',
              ),
            ),
          ),
        ),*/
        actions: [
          // AQUÍ va la foto
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
            ), // Un poco de margen a la derecha
            child: GestureDetector(
              // GestureDetector o InkWell están bien
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const DialogoCuentas(),
                );
              },
              child: const CircleAvatar(
                radius: 18, // Un tamaño un poco más estándar
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/16361358?v=4',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(children: [
            
        ],
      ),
      //
    );
  }
}
