import 'package:flutter/material.dart';
import 'package:todo_app/presentation/widgets/Dialogo/dialogo_opcion_cambiar_cuenta.dart';

class DialogoCuentas extends StatelessWidget {
  const DialogoCuentas({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // Usar Dialog en lugar de SimpleDialog te da más control de los bordes
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ), // Bordes redondeados estilo Google
      //Este padding se aplica el Dialogo no a los elementos
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Se ajusta al contenido
          children: [
            const DialogoOpcionCambiarCuenta(), // Tu widget personalizado de arriba (está bien)
            const Divider(),
            // Reemplazo de tus opciones manuales por ListTile
            ListTile(
              leading: const Icon(
                Icons.add_circle_outline,
              ), // Icono más similar al de "Agregar"
              title: const Text('Agregar otra cuenta'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.manage_accounts_outlined),
              title: const Text(
                'Administrar cuentas en este dispositivo',
              ), // Texto completo como en la captura
              titleAlignment: ListTileTitleAlignment.center, // Alineación
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Configuración de Tasks'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Ayuda y comentarios'),
              onTap: () {},
            ),
            // Política y privacidad abajo (Texto pequeño)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Política de Privacidad • Condiciones del Servicio",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
