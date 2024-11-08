import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';

class MyQuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecreasement;

  const MyQuantitySelector(
      {super.key,
      required this.quantity,
      required this.food,
      required this.onIncrement,
      required this.onDecreasement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecreasement,
            child: Icon(Icons.remove,
                size: 20, color: Theme.of(context).colorScheme.inversePrimary),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: SizedBox(
              width: 16,
              child: Center(
                child: Text(
                  quantity.toString(),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onIncrement,
            child: Icon(Icons.add,
                size: 20, color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ],
      ),
    );
  }
}
