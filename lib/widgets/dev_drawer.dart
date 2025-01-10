import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DevDrawer extends StatelessWidget {
  const DevDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Dev Navigation',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Navegación de desarrollo',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          _DrawerItem(
            icon: Icons.qr_code,
            title: 'Inicio QR',
            route: AppRoutes.inicio,
          ),
          _DrawerItem(
            icon: Icons.person,
            title: 'Registro',
            route: AppRoutes.registro,
          ),
          _DrawerItem(
            icon: Icons.attach_money,
            title: 'Presupuesto',
            route: AppRoutes.presupuesto,
          ),
          _DrawerItem(
            icon: Icons.map,
            title: 'Mapa',
            route: AppRoutes.mapa,
          ),
          _DrawerItem(
            icon: Icons.local_activity,
            title: 'Actividades',
            route: AppRoutes.actividades,
          ),
          _DrawerItem(
            icon: Icons.list,
            title: 'Opciones',
            route: AppRoutes.opciones,
          ),
          _DrawerItem(
            icon: Icons.details,
            title: 'Detalle',
            route: AppRoutes.detalle,
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ListTile(
      leading: Icon(
        icon,
        color: theme.colorScheme.secondary,
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge,
      ),
      onTap: () => Navigator.pushReplacementNamed(context, route),
    );
  }
} 
