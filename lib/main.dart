import 'package:flutter/material.dart';

void main() {
  runApp(const HagaloApp());
}

class HagaloApp extends StatelessWidget {
  const HagaloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
      ),
      home: const CatalogoScreen(),
    );
  }
}

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  final List<Map<String, String>> productos = const [
    {"nombre": "Lámpara Moderna", "desc": "Iluminación LED", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/lampara.jpg"},
    {"nombre": "Lavadora Turbo", "desc": "Carga frontal 20kg", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/lavadora.jfif"},
    {"nombre": "Licuadora Pro", "desc": "Cuchillas acero", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/licuadora.jfif"},
    {"nombre": "Microondas", "desc": "Digital 1.1 pies", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/microondas.jfif"},
    {"nombre": "Refrigerador", "desc": "No Frost inteligente", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/refrigerador.jpg"},
    {"nombre": "Rotomartillo", "desc": "Potencia industrial", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/rotomartillo.jpg"},
    {"nombre": "Tostador", "desc": "7 niveles tostado", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/tostador.webp"},
    {"nombre": "Aspiradora", "desc": "Succión potente", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/aspiradora.jfif"},
    {"nombre": "Batidora Pro", "desc": "Mezclado rápido", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/batidora.avif"},
    {"nombre": "Cafetera Elite", "desc": "Aroma intenso", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/cafetera.webp"},
    {"nombre": "Waflera", "desc": "Antiadherente", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/gluaflera.jpg"},
    {"nombre": "Plancha Vapor", "desc": "Cuidado textil", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/plancha.avif"},
    {"nombre": "Tostador Inox", "desc": "Diseño elegante", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/tostadooor.webp"},
    {"nombre": "Batidora Mano", "desc": "Ligera y potente", "url": "https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/batidora.avif"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8), // Fondo azulado muy tenue
      appBar: AppBar(
        title: const Text('Hagalo', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0D47A1),
        elevation: 10,
      ),
      // El GridView.builder permite el scroll automáticamente
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        // BouncingScrollPhysics hace que se sienta "elástico" al llegar al final (estilo iPhone)
        physics: const BouncingScrollPhysics(), 
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,           // 2 columnas
          childAspectRatio: 0.72,      // Ajuste de altura para las 7 filas
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                // Imagen con bordes redondeados arriba
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      child: Image.network(
                        producto['url']!,
                        fit: BoxFit.contain, // Para que el producto no se vea deforme
                      ),
                    ),
                  ),
                ),
                // Información del producto
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          producto['nombre']!,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0D47A1)),
                          maxLines: 1,
                        ),
                        Text(
                          producto['desc']!,
                          style: const TextStyle(fontSize: 11, color: Colors.black54),
                          maxLines: 1,
                        ),
                        // Estrellitas y botón de acción
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 14),
                            const Icon(Icons.star, color: Colors.amber, size: 14),
                            const Icon(Icons.star, color: Colors.amber, size: 14),
                            const Icon(Icons.star, color: Colors.amber, size: 14),
                            const Icon(Icons.star_half, color: Colors.amber, size: 14),
                            const Spacer(),
                            const Icon(Icons.add_shopping_cart, color: Colors.blue, size: 18),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}