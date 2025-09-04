import 'package:flutter/material.dart';

import '../../Components/Card/card.dart';
import '../../Components/Card/card_view_model.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  // Animation state
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    // Sample data for the card items
    final List<CardItem> cardItems = [
      CardItem(icon: Icons.kitchen, label: 'Kitchen', onTap: () => _showSnackBar('Kitchen tapped!')),
      CardItem(icon: Icons.bathtub, label: 'Bathroom', onTap: () => _showSnackBar('Bathroom tapped!')),
      CardItem(icon: Icons.chair, label: 'Sofa', onTap: () => _showSnackBar('Sofa tapped!')),
    ];

    // Placeholder for the top illustration
    final Widget topIllustration = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.lightbulb, color: Colors.yellow.shade700, size: 30),
        const SizedBox(width: 20),
        const Icon(Icons.people, color: Colors.white, size: 70),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Component'),
        backgroundColor: Colors.grey[100],
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isTapped = !_isTapped;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              transform: _isTapped ? (Matrix4.identity()..scale(0.95)) : Matrix4.identity(),
              child: CustomCard(
                temperature: '32',
                day: '24',
                month: 'January',
                items: cardItems,
                topContent: topIllustration,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
