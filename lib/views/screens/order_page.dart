import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Orders",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔹 Dummy Order Card 1
          _buildOrderCard(
            orderId: "ORD12345",
            status: "Delivered",
            date: "20 Aug 2025",
            price: "₹1,299",
          ),

          // 🔹 Dummy Order Card 2
          _buildOrderCard(
            orderId: "ORD12346",
            status: "Processing",
            date: "21 Aug 2025",
            price: "₹799",
          ),

          // 🔹 Dummy Order Card 3
          _buildOrderCard(
            orderId: "ORD12347",
            status: "Shipped",
            date: "22 Aug 2025",
            price: "₹2,499",
          ),
        ],
      ),
    );
  }

  /// ✅ Order Card Widget
  Widget _buildOrderCard({
    required String orderId,
    required String status,
    required String date,
    required String price,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Order ID + Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order ID: $orderId",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: status == "Delivered"
                        ? Colors.green
                        : status == "Processing"
                            ? Colors.orange
                            : Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // 🔹 Date & Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date: $date",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
