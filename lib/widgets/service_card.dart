import 'package:flutter/material.dart';
import '../pages/subscription_page.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool blueButton;
  final bool discount;

  const ServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.blueButton = false,
    this.discount = false,
  });

  @override
Widget build(BuildContext context) {
  return Container(
    width: double.infinity,

    padding: const EdgeInsets.all(16),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    ),

    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.recycling,
                  color: Color(0xff1FA64B),
                  size: 24,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueButton
                        ? Colors.blue
                        : const Color(0xff1FA64B),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SubscriptionPage(),
                      ),
                    );
                  },
                  child: Text(
                    blueButton
                        ? "Pesan Sekarang"
                        : "Lihat Paket",
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 12),

        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                shape: BoxShape.circle,
              ),
            ),

            const Positioned.fill(
              child: Center(
                child: Icon(
                  Icons.local_shipping_rounded,
                  size: 55,
                  color: Color(0xff1FA64B),
                ),
              ),
            ),

            if (discount)
              Positioned(
                right: -5,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "30%",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    ),
  );
 }
}
