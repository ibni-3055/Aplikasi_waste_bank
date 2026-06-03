import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';

class RedeemSuccessPage extends StatelessWidget {
  const RedeemSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Pembayaran"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          children: [
            const SizedBox(height: 60),

            const CircleAvatar(
              radius: 40,
              backgroundColor:
                  Color(0xff1FA64B),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
            ),

            const SizedBox(height: 35),

            const Text(
              "Penukaran Kode\nEcoLink Berhasil",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Paket langganan sudah aktif dan tersimpan.",
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            SizedBox(
  width: double.infinity,
  height: 52,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff1FA64B),
    ),
    onPressed: () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        ),
        (route) => false,
      );
    },
    child: const Text(
      "Kembali ke Beranda",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}