import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Colores principales
        colorScheme: ColorScheme.light(
          primary: const Color(0xFFFF385C),
          secondary: const Color(0xFF008489),
          surface: Colors.white,
          background: const Color(0xFFF7F7F7),
          error: Colors.red,
        ),
        
        // Tipografía
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.copyWith(
            // Títulos
            headlineLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF333333),
            ),
            // Subtítulos
            titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF717171),
            ),
            // Texto informativo
            bodyLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: const Color(0xFF717171),
            ),
          ),
        ),
        
        // Componentes
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF333333),
          elevation: 0,
          centerTitle: true,
        ),
        
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: Colors.black.withOpacity(0.1),
        ),
        
        // Botones
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF385C),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
        ),
      ),
      initialRoute: AppRoutes.inicio,
      routes: AppRoutes.getRoutes(),
    );
  }
}
