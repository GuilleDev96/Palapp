import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vistas/vistas_inicio.dart';
import 'vistas/vistas_catalogo.dart';
import 'vistas/vistas_comparador.dart';
import 'vistas/vistas_perfil.dart';
import 'dart:ui';

void main() {
  runApp(const Palapp());
}

class Palapp extends StatelessWidget {
  const Palapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        // Configuramos la nueva paleta de colores global
        primaryColor: const Color(0xFF007AC2), // Verde Pista Vibrante
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007AC2),
          primary: const Color(0xFF007AC2),
          secondary: const Color(0xFF111827), // Azul Carbón
        ),
        useMaterial3: true,
        // Tipografía Poppins global con textos oscurecidos al Azul Carbón
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: const Color(0xFF111827),
          displayColor: const Color(0xFF111827),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pantallas = [
    const VistaInicio(),
    const VistaCatalogo(),
    const VistaComparador(),
    const VistaPerfil(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      extendBody: true, 
      appBar: AppBar(
        title: Text(
          'PALAPP', // En mayúsculas para darle el toque de marca deportiva
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w900, // ExtraBold / Black
            fontStyle: FontStyle.italic, // Cursiva dinámica
            color: const Color(0xFF007AC2), // Nuevo Azul Pista
            fontSize: 28,
            letterSpacing: -1.0, // Letras más juntas
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: _pantallas[_selectedIndex],
      
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white.withValues(alpha: 0.85), // Fondo translúcido
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  currentIndex: _selectedIndex,
                  selectedItemColor: const Color(0xFF007AC2),
                  unselectedItemColor: Colors.grey.shade400,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  onTap: _onItemTapped,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Inicio'),
                    BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'Catálogo'),
                    BottomNavigationBarItem(icon: Icon(Icons.balance_rounded), label: 'Comparar'),
                    BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Perfil'),
                  ],
                ),
              ),
            ),
         ),
        ),
      ),
    ); 
  }
}
