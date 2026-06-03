import 'package:flutter/material.dart';
import 'redeem_code_page.dart';

class PaymentConfigPage extends StatelessWidget {
  const PaymentConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      appBar: AppBar(
        title: const Text("Pembayaran"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),

            const Icon(
              Icons.lock_outline,
              size: 55,
              color: Color(0xff1FA64B),
            ),

            const SizedBox(height: 20),

            const Text(
              "Konfigurasi\nPembayaran",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Pilih metode pembayaran",
            ),

            const SizedBox(height: 25),

            _paymentTile(
              context,
              title: "Kartu Kredit atau Debit",
              icon: Icons.credit_card,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Metode pembayaran belum tersedia",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _paymentTile(
              context,
              title: "Dompet Digital",
              icon: Icons.account_balance_wallet,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Metode pembayaran belum tersedia",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _paymentTile(
              context,
              title: "Kode Hadiah",
              icon: Icons.card_giftcard,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RedeemCodePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _paymentTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(15),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),

        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xff1FA64B),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const Icon(
              Icons.chevron_right,
            ),
          ],
        ),
      ),
    );
  }
}