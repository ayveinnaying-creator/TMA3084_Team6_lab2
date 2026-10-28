import 'package:flutter/material.dart';

void main() => runApp(const RestaurantApp());

// Simple data class describing one menu item
class Food {
  final String name;
  final String category;
  final double price;
  final String description;
  final IconData icon;
  final MaterialColor color;

  const Food({
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.icon,
    required this.color,
  });
}

const List<Food> menu = [
  Food(
    name: 'Nasi Lemak',
    category: 'Rice',
    price: 8.50,
    description:
        'Fragrant coconut rice served with sambal, crispy anchovies, '
        'roasted peanuts, cucumber and a boiled egg.',
    icon: Icons.rice_bowl,
    color: Colors.orange,
  ),
  Food(
    name: 'Chicken Satay',
    category: 'Grill',
    price: 12.00,
    description:
        'Marinated chicken skewers grilled over charcoal, served with '
        'rich peanut sauce, ketupat and onions.',
    icon: Icons.kebab_dining,
    color: Colors.red,
  ),
  Food(
    name: 'Laksa',
    category: 'Noodles',
    price: 10.00,
    description:
        'Rice noodles in a spicy and creamy coconut broth topped with '
        'prawns, bean sprouts and fresh herbs.',
    icon: Icons.ramen_dining,
    color: Colors.green,
  ),
];

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Today\'s Specials',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text('Tap a card to see more details'),
          const SizedBox(height: 16),
          for (final food in menu) FoodCard(food: food),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodDetailPage(food: food)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: food.color.shade100,
                child: Icon(food.icon, size: 40, color: food.color.shade800),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      food.category,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'RM ${food.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final Food food;

  const FoodDetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: food.color.shade100,
                child: Icon(food.icon, size: 80, color: food.color.shade800),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              food.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Chip(label: Text(food.category)),
            const SizedBox(height: 16),
            Text(
              'RM ${food.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(food.description, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to Menu'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
