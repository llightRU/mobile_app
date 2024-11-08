import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) {
                  final receipt = restaurant.displayCartReceipt().split("\n");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: receipt.map((line) {
                      if (line.contains("Here's your receipt")) {
                        return Text(
                          line,
                          style: const TextStyle(
                            fontSize: 22, // Larger font size for title
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else if (line.contains("Total Price") ||
                          line.contains("Total Items")) {
                        return Text(
                          line,
                          style: const TextStyle(
                            fontSize: 20, // Slightly smaller for totals
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else if (line.contains("------------")) {
                        return const Divider();
                      } else {
                        return Text(
                          line,
                          style: const TextStyle(
                            fontSize: 18, // Smaller font size for regular items
                            fontWeight: FontWeight.normal,
                          ),
                        );
                      }
                    }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Thank you for your order!",
              style: TextStyle(
                fontSize: 18, // Larger font size for emphasis
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Estimated delivery time for 15-30 minutes",
              style: TextStyle(
                fontSize: 14, // Smaller font size for secondary info
                fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
