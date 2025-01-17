import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/provider/dashboard_screen.dart';
import '../screens/provider/qr_scanner_screen.dart';
import '../screens/provider/reservations_screen.dart';
import '../screens/provider/commissions_screen.dart';
import '../screens/provider/balance_screen.dart';
import '../screens/provider/change_password_screen.dart';
import '../screens/screens.dart';

class AppRouter {
  static const String login = '/login';
  static const String inicio = '/inicio';
  static const String registro = '/registro';
  static const String presupuesto = '/presupuesto';
  static const String mapa = '/mapa';
  static const String actividades = '/actividades';
  static const String opciones = '/opciones';
  static const String detalle = '/detalle';
  static const String providerDashboard = '/provider/dashboard';
  static const String providerQRScanner = '/provider/qr-scanner';
  static const String providerReservations = '/provider/reservations';
  static const String providerCommissions = '/provider/commissions';
  static const String providerBalance = '/provider/balance';
  static const String providerChangePassword = '/provider/change-password';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case inicio:
        return MaterialPageRoute(builder: (_) => const InicioScreen());
      case registro:
        return MaterialPageRoute(builder: (_) => const RegistroScreen());
      case presupuesto:
        return MaterialPageRoute(builder: (_) => const PresupuestoScreen());
      case mapa:
        return MaterialPageRoute(builder: (_) => const MapaScreen());
      case actividades:
        return MaterialPageRoute(builder: (_) => const ActividadesScreen());
      case opciones:
        return MaterialPageRoute(builder: (_) => const OpcionesScreen());
      case detalle:
        return MaterialPageRoute(builder: (_) => const DetalleScreen());
      case providerDashboard:
        return MaterialPageRoute(builder: (_) => const ProviderDashboardScreen());
      case providerQRScanner:
        return MaterialPageRoute(builder: (_) => const QRScannerScreen());
      case providerReservations:
        return MaterialPageRoute(builder: (_) => const ReservationsScreen());
      case providerCommissions:
        return MaterialPageRoute(builder: (_) => const CommissionsScreen());
      case providerBalance:
        return MaterialPageRoute(builder: (_) => const BalanceScreen());
      case providerChangePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
} 
