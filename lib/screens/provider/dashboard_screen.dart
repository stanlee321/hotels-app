import 'package:flutter/material.dart';

class ProviderDashboardScreen extends StatelessWidget {
  const ProviderDashboardScreen({Key? key}) : super(key: key);

  // Colores de Airbnb según ux.md
  static const Color primaryColor = Color(0xFFFF385C);
  static const Color secondaryColor = Color(0xFF008489);
  static const Color backgroundColor = Color(0xFFF7F7F7);
  static const Color textColor = Color(0xFF333333);
  static const Color subtextColor = Color(0xFF717171);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Prevenir el botón back
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text('Panel del Proveedor'),
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: textColor,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 35,
                        color: subtextColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Proveedor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'provider@example.com',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Inicio'),
                      onTap: () {
                        Navigator.pop(context); // Cerrar drawer
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Configuración'),
                      onTap: () {
                        Navigator.pop(context);
                        // TODO: Navegar a configuración
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.help),
                      title: const Text('Ayuda'),
                      onTap: () {
                        Navigator.pop(context);
                        // TODO: Navegar a ayuda
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout, color: primaryColor),
                title: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: primaryColor),
                ),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _DashboardCard(
              icon: Icons.qr_code_scanner,
              title: 'Escanear QR',
              onTap: () {
                Navigator.pushNamed(context, '/provider/qr-scanner');
              },
            ),
            _DashboardCard(
              icon: Icons.list_alt,
              title: 'Reservas',
              onTap: () {
                Navigator.pushNamed(context, '/provider/reservations');
              },
            ),
            _DashboardCard(
              icon: Icons.monetization_on,
              title: 'Comisiones',
              onTap: () {
                Navigator.pushNamed(context, '/provider/commissions');
              },
            ),
            _DashboardCard(
              icon: Icons.account_balance_wallet,
              title: 'Saldo',
              onTap: () {
                Navigator.pushNamed(context, '/provider/balance');
              },
            ),
            _DashboardCard(
              icon: Icons.lock,
              title: 'Cambiar Contraseña',
              onTap: () {
                Navigator.pushNamed(context, '/provider/change-password');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: const Color(0xFFFF385C),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
