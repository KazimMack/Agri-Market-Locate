import 'package:flutter/material.dart';

class FarmerDetailScreen extends StatelessWidget {
  final Map<String, dynamic> farmer;

  const FarmerDetailScreen({required this.farmer, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer: ${farmer['name']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Region: ${farmer['region']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Products:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: farmer['products'].length,
                itemBuilder: (context, index) {
                  final product = farmer['products'][index];
                  return Card(
                    child: ListTile(
                      title: Text(product),
                      trailing: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('You ordered $product from ${farmer['name']}!'),
                            ),
                          );
                        },
                        child: const Text('Order'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
