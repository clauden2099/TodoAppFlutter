import 'package:flutter/material.dart';

class DialogoOpcionCambiarCuenta extends StatelessWidget {
  const DialogoOpcionCambiarCuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. ENCABEZADO (La X y el Logo de Google)
        Stack(
          /*Esta es la posición que tomaran por defecto los elementos del stack en caso
          de que no se tengan su propio Align que los envuelva */
          alignment: Alignment.center,
          children: [
            //Boton X
            //Con el Align permite colocar los elementos en partes en concreto dentro del stack
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.close)),
            ),
            //Texto
            Text(
              'Google',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        // 2. INFORMACIÓN DEL USUARIO (Usamos ListTile para alineación perfecta)
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/16361358?v=4',
            ),
          ),
          title: const Text(
            'Alan Javier Hernandez Camarena',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text(
            'alanjavier852@gmial.com',
            style: TextStyle(fontSize: 12),
          ),
          // El trailing es opcional, a veces aparece un indicador
        ),
        const SizedBox(height: 5),
        // 3. BOTÓN "ADMINISTRAR" (Estilo Píldora)
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            // Esto le da la forma redondeada completa
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            // Color del borde
            side: BorderSide(color: Colors.grey.shade600),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          ),
          child: const Text(
            'Administrar tu Cuenta de Google',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black, // O el color que corresponda al tema
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
