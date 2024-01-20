import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MY LOVE 2 <3'),  //Título de la aplicación en la barra de la aplicación.
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  Imagen cargada desde una URL
              Image.network(
                'https://i0.wp.com/www.homosensual.com/wp-content/uploads/2020/01/fotos-integrantes-BTS.jpg?fit=1200%2C900&ssl=1',
                width: 100,
                height: 100,
              ),
              
              // Icono de carita feliz
              Icon(Icons.sentiment_very_satisfied, size: 50),
              
              // Texto con estilo
              Text('También me gustan los BTS', style: TextStyle(fontSize: 30)),
              
              // Contenedor con color de fondo y texto
              Container(
                color: Color.fromARGB(255, 219, 154, 233),
                child: Text(
                  'BTS <3',
                  style: TextStyle(color: Color.fromARGB(255, 6, 1, 8)),
                ),
              ),
            
              ElevatedButton(
                onPressed: () {
                  // Acción cuando se presiona el botón.
                },
                child: Text('BOTONCITO DE DAR AMOR <3'),
              ),
              
              // Logo de Flutter
              FlutterLogo(size: 100),
              
              // Campo de texto
              TextField(
                decoration: InputDecoration(labelText: 'Cuentame un chisme :)'),
              ),
              
              //  Círculo con avatar cargado desde una URL
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://www.shutterstock.com/image-vector/bangtan-logo-kpop-bts-simple-600nw-2100912457.jpg'),
              ),
              
              // esto es un  Interruptor Acción cuando cambia el interruptor.
              Switch(
                value: true,
                onChanged: (bool value) {
                 
                },
              ),
              
              // 11. Indicador de progreso circular
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}