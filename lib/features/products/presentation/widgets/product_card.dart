import 'package:flutter/material.dart';

import 'package:riverpod3_starter/features/products/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, required this.onTap, super.key});

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Text('\$${product.price.toStringAsFixed(1)}'),
                ],
              ),
              const SizedBox(height: 8),
              Text(product.description),
              const SizedBox(height: 8),
              Chip(label: Text(product.category)),
            ],
          ),
        ),
      ),
    );
  }
}
