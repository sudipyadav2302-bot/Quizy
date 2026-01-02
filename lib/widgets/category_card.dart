import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String route;
  final String level; // to pass default level or tag if needed

  const CategoryCard({
    super.key,
    required this.title,
    required this.route,
    this.level = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
