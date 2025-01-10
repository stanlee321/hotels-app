import 'package:flutter/material.dart';
import '../models/activity_category.dart';
import '../widgets/dev_drawer.dart';

class ActividadesScreen extends StatefulWidget {
  const ActividadesScreen({Key? key}) : super(key: key);

  @override
  State<ActividadesScreen> createState() => _ActividadesScreenState();
}

class _ActividadesScreenState extends State<ActividadesScreen> {
  final List<ActivityCategory> categories = [
    ActivityCategory(
      id: 'tours',
      name: 'Tours Guiados',
      icon: Icons.tour,
      route: '/opciones',
    ),
    ActivityCategory(
      id: 'rentals',
      name: 'Rentas Auto, Barco',
      icon: Icons.directions_car,
      route: '/opciones',
    ),
    ActivityCategory(
      id: 'events',
      name: 'Eventos',
      icon: Icons.event,
      route: '/opciones',
    ),
    ActivityCategory(
      id: 'nightlife',
      name: 'Vida Nocturna',
      icon: Icons.nightlife,
      route: '/opciones',
    ),
    ActivityCategory(
      id: 'places',
      name: 'Lugares',
      icon: Icons.place,
      route: '/opciones',
    ),
    ActivityCategory(
      id: 'shopping',
      name: 'Compras',
      icon: Icons.shopping_bag,
      route: '/opciones',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades'),
      ),
      drawer: const DevDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final ActivityCategory category;

  const _CategoryCard({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          category.route,
          arguments: category,
        ),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              size: 48,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
