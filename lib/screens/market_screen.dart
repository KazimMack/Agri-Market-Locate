import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Markets'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Local Markets'),
              Tab(text: 'International Markets'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LocalMarkets(),
            InternationalMarkets(),
          ],
        ),
      ),
    );
  }
}

// Local Markets screen
class LocalMarkets extends StatelessWidget {
  const LocalMarkets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildMarketTile(context, 'Dar es Salaam Central Market', 'Vegetables, Fruits'),
        _buildMarketTile(context, 'Arusha Market', 'Maize, Rice'),
        // Add more local markets here
      ],
    );
  }

  Widget _buildMarketTile(BuildContext context, String marketName, String products) {
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Market: $marketName', style: Theme.of(context).textTheme.titleLarge),
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
                          'Order placed for $quantity of $products at $price from $marketName!'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter all details')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}

// International Markets screen
class InternationalMarkets extends StatelessWidget {
  const InternationalMarkets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildMarketTile(context, 'New York Market Hub', 'Fruits, Meat | Location: USA'),
        _buildMarketTile(context, 'London Food Hub', 'Vegetables, Dairy | Location: UK'),
        // Add more international markets here
      ],
    );
  }

  Widget _buildMarketTile(BuildContext context, String marketName, String products) {
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Market: $marketName', style: Theme.of(context).textTheme.titleLarge),
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
                          'Order placed for $quantity of $products at $price from $marketName!'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter all details')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
