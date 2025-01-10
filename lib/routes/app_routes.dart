import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const String inicio = '/inicio';
  static const String registro = '/registro';
  static const String presupuesto = '/presupuesto';
  static const String mapa = '/mapa';
  static const String actividades = '/actividades';
  static const String opciones = '/opciones';
  static const String detalle = '/detalle';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      inicio: (context) => const InicioScreen(),
      registro: (context) => const RegistroScreen(),
      presupuesto: (context) => const PresupuestoScreen(),
      mapa: (context) => const MapaScreen(),
      actividades: (context) => const ActividadesScreen(),
      opciones: (context) => const OpcionesScreen(),
      detalle: (context) => const DetalleScreen(),
    };
  }
} 
