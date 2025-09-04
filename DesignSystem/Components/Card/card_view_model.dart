import 'package:flutter/material.dart';
import 'card.dart';

class CustomCard extends StatelessWidget {
  final Color backgroundColor;
  final String temperature;
  final String day;
  final String month;
  final List<CardItem> items;
  final Widget? topContent; // For the illustration

  const CustomCard({
    super.key,
    this.backgroundColor = const Color(0xFF3A47A6),
    required this.temperature,
    required this.day,
    required this.month,
    required this.items,
    this.topContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Make column wrap its content
        children: [
          // Top section for illustration
          SizedBox(
            height: 120, // Adjust as needed
            child: topContent ?? Container(),
          ),
          const SizedBox(height: 20),
          // Date and Temperature Section
          _buildDateAndTemp(),
          const SizedBox(height: 30),
          // Circular Items Section
          _buildCardItems(),
        ],
      ),
    );
  }

  Widget _buildDateAndTemp() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.white, fontFamily: '.SF UI Text'),
            children: [
              TextSpan(
                text: day,
                style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text: '\n', // New line
                style: TextStyle(fontSize: 4), // Small space between lines
              ),
              TextSpan(
                text: month,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        // Temperature with degree symbol
        Text(
          '$temperature°C',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _buildCardItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items.map((item) => _buildCircleItem(item)).toList(),
    );
  }

  Widget _buildCircleItem(CardItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            item.label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
