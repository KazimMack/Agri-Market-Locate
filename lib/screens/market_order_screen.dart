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

class LocalMarkets extends StatelessWidget {
  const LocalMarkets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildMarketTile(context, 'Dar es Salaam Central Market', 'Vegetables, Fruits'),
        _buildMarketTile(context, 'Arusha Market', 'Maize, Rice'),
        // Add more markets here
      ],
    );
  }

  Widget _buildMarketTile(BuildContext context, String marketName, String products) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: ListTile(
        title: Text(marketName),
        subtitle: Text('Products: $products'),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MarketOrderScreen(marketName: marketName, products: products),
              ),
            );
          },
          child: const Text('Order'),
        ),
      ),
    );
  }
}

class InternationalMarkets extends StatelessWidget {
  const InternationalMarkets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildMarketTile(context, 'New York Market Hub', 'Fruits, Meat | USA'),
        _buildMarketTile(context, 'London Food Hub', 'Vegetables, Dairy | UK'),
        // Add more markets here
      ],
    );
  }

  Widget _buildMarketTile(BuildContext context, String marketName, String products) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: ListTile(
        title: Text(marketName),
        subtitle: Text('Products: $products'),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MarketOrderScreen(marketName: marketName, products: products),
              ),
            );
          },
          child: const Text('Order'),
        ),
      ),
    );
  }
}

class MarketOrderScreen extends StatelessWidget {
  final String marketName;
  final String products;

  const MarketOrderScreen({super.key, required this.marketName, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order from $marketName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Market: $marketName', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Available Products: $products'),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Order Quantity',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate order processing
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order placed at $marketName')),
                );
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
