import 'package:flutter/material.dart';

class BuyProductsScreen extends StatelessWidget {
  const BuyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample product data with images
    final List<Map<String, String>> products = [
      {
        'name': 'Vegetables',
        'image': 'assets/vegetables.jpg',
        'price': '10 USD',
      },
      {
        'name': 'Meat',
        'image': 'assets/meat.jpg',
        'price': '20 USD',
      },
      {
        'name': 'Fruits',
        'image': 'assets/fruits.jpg',
        'price': '8 USD',
      },
      {
        'name': 'Spices Product',
        'image': 'assets/spices.jpg',
        'price': '5 USD',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Image.asset(
                  product['image']!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product['name']!),
                subtitle: Text('Price: ${product['price']}'),
                trailing: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product['name']} purchased!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Buy'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
