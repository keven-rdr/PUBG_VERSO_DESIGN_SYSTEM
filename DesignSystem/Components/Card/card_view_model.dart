import 'package:flutter/material.dart';
import 'card.dart';

class CustomCard extends StatelessWidget {
  final Color backgroundColor;
  final String temperature;
  final String day;
  final String month;
  final List<CardItem> items;
  final Widget? topContent;

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
      // MUDANÇA 1: Usar um Stack para permitir sobreposição.
      child: Stack(
        // MUDANÇA 2: ESSENCIAL! Permite que os filhos do Stack "vazem" para fora.
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 80),
                _buildDateAndTemp(),
                const SizedBox(height: 30),
                _buildCardItems(),
              ],
            ),
          ),

          // MUDANÇA 3: Usar o widget Positioned para controlar a localização da animação.
          if (topContent != null)
            Positioned(
              top: -75,
              right: -29,
              width: 260,
              height: 260,
              child: topContent!,
            ),
        ],
      ),
    );
  }

  Widget _buildDateAndTemp() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.white, fontFamily: '.SF UI Text'),
            children: [
              TextSpan(
                text: day,
                style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text: '\n',
                style: TextStyle(fontSize: 4),
              ),
              TextSpan(
                text: month,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
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