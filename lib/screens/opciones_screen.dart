import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../widgets/dev_drawer.dart';

class OpcionesScreen extends StatefulWidget {
  const OpcionesScreen({Key? key}) : super(key: key);

  @override
  State<OpcionesScreen> createState() => _OpcionesScreenState();
}

class _OpcionesScreenState extends State<OpcionesScreen> {
  // Mock data para pruebas
  final List<Activity> activities = [
    Activity(
      id: 1,
      name: 'Museo de Historia Mexicana',
      subtitle: 'Museos',
      rating: 5,
      price: 40,
      imageUrl: 'https://www.3museos.com/wp-content/uploads/2024/09/catrin-catrina-2024-1.jpg',
      address: 'Rafael J. Verger',
      provider: 'Turismo Nuevo León',
      schedule: '09:00 - 18:00',
      availability: 'Todo el año',
    ),
    Activity(
      id: 2,
      name: 'Museo del Noreste | MUNE',
      subtitle: 'Museos',
      rating: 4,
      price: 40,
      imageUrl: 'https://www.3museos.com/wp-content/uploads/2024/06/conc_21jul.jpg',
      address: 'MUNE',
      provider: 'MUNE',
      schedule: '09:00 - 18:00',
      availability: 'Todo el año',
    ),
    Activity(
      id: 3,
      name: 'Museo del Palacio',
      subtitle: 'Museos',
      rating: 4,
      price: 0,
      imageUrl: 'https://www.3museos.com/wp-content/uploads/2023/11/fm_1.jpg',
      address: 'Palacio de Gobierno',
      provider: 'Turismo Nuevo León',
      schedule: '09:00 - 18:00',
      availability: 'Todo el año',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cultural'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      drawer: const DevDrawer(),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: activities.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final activity = activities[index];
          return _ActivityCard(
            activity: activity,
            onTap: () => _navigateToDetail(activity),
            onFavoriteToggle: () => _toggleFavorite(index),
          );
        },
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtrar y Ordenar'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Precio (menor a mayor)'),
              onTap: () {
                setState(() {
                  activities.sort((a, b) => a.price.compareTo(b.price));
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Calificación (mayor a menor)'),
              onTap: () {
                setState(() {
                  activities.sort((a, b) => b.rating.compareTo(a.rating));
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetail(Activity activity) {
    Navigator.pushNamed(
      context, 
      '/detalle',
      arguments: activity,
    );
  }

  void _toggleFavorite(int index) {
    setState(() {
      activities[index].isFavorite = !activities[index].isFavorite;
    });
  }
}

class _ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const _ActivityCard({
    required this.activity,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  activity.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.museum,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 200,
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      activity.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: activity.isFavorite ? Colors.red : Colors.white,
                    ),
                    onPressed: onFavoriteToggle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        return Icon(
                          index < activity.rating
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                      const SizedBox(width: 8),
                      Text(
                        activity.price == 0
                            ? 'Gratis'
                            : '\$${activity.price.toStringAsFixed(0)}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
