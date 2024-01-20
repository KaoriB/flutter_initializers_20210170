import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // Configuración inicial de la aplicación Flutter
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Definición del esquema de colores para la aplicación
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 240, 163, 196)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'OLA <3'), // Establecer la página principal
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(); // Controlador de animación para la rotación continua

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    // Incrementar el contador al hacer clic en el botón
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            
            
              const Text(
                'Cuantas veces has dado clic <3:', // Etiqueta de texto
              ),
              Text(
                '$_counter', // Mostrar el contador
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 2),
              Image(
                height: 150,
                image: NetworkImage(
                    'https://img.pikbest.com/backgrounds/20190307/cartoon-cute-strawberry-pink-background_1871263.jpg!bw700'),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: const Color.fromARGB(250, 200, 120, 140),
                    size: 50.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Icon(
                    Icons.audiotrack,
                    color: Color.fromARGB(250, 240, 130, 220),
                    size: 50.0,
                  ),
                  Icon(
                    Icons.beach_access,
                    color: Color.fromARGB(250, 240, 30, 140),
                    size: 50.0,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const AnimatedAlignExample(), // Widget animado de alineación
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: 'Mi',
                  children: <TextSpan>[
                    TextSpan(text: ' novio es muy ', style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(text: ' lindo', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: <Widget>[
                  FlutterLogo(),
                  Expanded(
                    child: Text(
                      "Me gustan mucho las fresas y mi novio <3 ",
                    ),
                  ),
                  Icon(Icons.sentiment_very_satisfied),



                  
                ],
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: const Text('Quintero'),
              ),
              const SizedBox(height: 5),
              const AnimatedBuilderExample(), // Widget animado construido mediante un constructor
              const SizedBox(height: 5),
              const SlideTransitionExample(), // Widget de transición de deslizamiento

            ],
          
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({Key? key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Color.fromARGB(255, 242, 153, 214),
          child: AnimatedAlign(
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(size: 50.0),
          ),
        ),
      ),
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(); // Controlador de animación para la rotación continua

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 39.0,
        height: 20.0,
        color: Color.fromARGB(255, 231, 156, 235),
        child: const Center(
          child: Text('Jesus'),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 1.0 * math.pi,
          child: child,
        );
      },
    );
  }
}

class SlideTransitionExample extends StatefulWidget {
  const SlideTransitionExample({super.key});

  @override
  State<SlideTransitionExample> createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true); // Controlador de animación para la transición de deslizamiento
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: FlutterLogo(size: 80.0),
      ),
    );
  }
}