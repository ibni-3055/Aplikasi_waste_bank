import 'package:flutter/material.dart';
import '../pages/payment_config_page.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  
  @override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,

    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: const BackButton(
          color: Colors.black,
        ),
      ),
    ),

    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffEAF8EE),
            Color(0xffF8FBF8),
          ],
        ),
      ),

      child: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER + FLOATING CARD
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/truck3.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Colors.black.withOpacity(0.15),
                  ),
                ),

                Positioned(
                  left: 20,
                  right: 20,
                  bottom: -150,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.local_shipping_rounded,
                                color: Color(0xff1FA64B),
                                size: 28,
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Expanded(
                              child: Text(
                                "Pickup Berlangganan",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          "Nikmati layanan penjemputan sampah secara rutin dengan harga yang lebih hemat dan jadwal yang fleksibel.",
                          style: TextStyle(
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 18),

                        featureTile(
                          Icons.check_circle,
                          "Penjemputan sampah rutin",
                        ),

                        featureTile(
                          Icons.check_circle,
                          "Area layanan luas",
                        ),

                        featureTile(
                          Icons.check_circle,
                          "Harga layanan terjangkau",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 170),

            const Text(
              "Paket Langganan",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            packageCard(
  context: context,
  color: Colors.green,
              title: "1 Minggu",
              oldPrice: "40.000",
              price: "30.000",
              subtitle: "/ minggu",
              features: [
                "2x penjemputan per bulan",
                "Driver siap datang tepat waktu",
                "Bisa ubah jadwal tanpa biaya",
              ],
            ),

            const SizedBox(height: 20),

            packageCard(
              context: context,
              color: Colors.orange,
              title: "1 Bulan",
              oldPrice: "160.000",
              price: "100.000",
              subtitle: "/ bulan",
              features: [
                "8x penjemputan per bulan",
                "Driver siap datang tepat waktu",
                "Bisa ubah jadwal tanpa biaya",
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    ),
  );
}

  static Widget featureTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

 static Widget packageCard({
  required BuildContext context,
    required Color color,
    required String title,
    required String oldPrice,
    required String price,
    required String subtitle,
    required List<String> features,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),

      child: Container(
        decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(25),

  border: Border.all(
    color: color.withOpacity(0.2),
    width: 1.5,
  ),

  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ],
),

        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Rp$oldPrice",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),

              Row(
                children: [
                  Text(
                    "Rp$price",
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(subtitle),
                ],
              ),

              const Divider(),

              ...features.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: color, size: 18),
                      const SizedBox(width: 10),
                      Expanded(child: Text(e)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
  width: double.infinity,
  height: 55,

  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.white,
      elevation: 0,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),

  onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const PaymentConfigPage(),
    ),
  );
},

    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Mulai Berlangganan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8),
        Icon(Icons.arrow_forward_ios, size: 14),
      ],
    ),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}
