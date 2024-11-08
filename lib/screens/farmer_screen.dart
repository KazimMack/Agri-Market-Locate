import 'package:flutter/material.dart';

class FarmerScreen extends StatelessWidget {
  const FarmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Farmers'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Local Farmers'),
              Tab(text: 'International Farmers'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LocalFarmers(),
            InternationalFarmers(),
          ],
        ),
      ),
    );
  }
}

// Local Farmers screen
class LocalFarmers extends StatelessWidget {
  const LocalFarmers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildFarmerTile(context, 'John Doe', 'Maize, Rice', 'Morogoro'),
        _buildFarmerTile(context, 'Jane Smith', 'Coffee, Tea', 'Mbeya'),
        // Add more local farmers here
      ],
    );
  }

  Widget _buildFarmerTile(
    BuildContext context,
    String name,
    String products,
    String region,
  ) {
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Farmer: $name', style: Theme.of(context).textTheme.titleLarge),
            Text('Region: $region'),
            Text('Products: $products'),
            const SizedBox(height: 10),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity (e.g., 1kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price (e.g., 10 USD)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final quantity = quantityController.text;
                final price = priceController.text;
                if (quantity.isNotEmpty && price.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Order placed for $quantity of $products at $price from $name!'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter all details')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}

// International Farmers screen
class InternationalFarmers extends StatelessWidget {
  const InternationalFarmers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildFarmerTile(context, 'David Brown', 'Wheat, Corn', 'USA'),
        _buildFarmerTile(context, 'Maria Garcia', 'Grapes, Olives', 'Spain'),
        // Add more international farmers here
      ],
    );
  }

  Widget _buildFarmerTile(
    BuildContext context,
    String name,
    String products,
    String location,
  ) {
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Farmer: $name', style: Theme.of(context).textTheme.titleLarge),
            Text('Location: $location'),
            Text('Products: $products'),
            const SizedBox(height: 10),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity (e.g., 1kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price (e.g., 10 USD)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final quantity = quantityController.text;
                final price = priceController.text;
                if (quantity.isNotEmpty && price.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Order placed for $quantity of $products at $price from $name!'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter all details')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
