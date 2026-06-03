import 'package:flutter/material.dart';

class TopupIndomaretPage extends StatelessWidget {
  const TopupIndomaretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Indomaret")),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            "Cara isi EcoPay 🪙",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),

          StepItem(
            number: 1,
            text: "Minta bantuan kasir untuk mengisi EcoPay.",
          ),

          StepItem(number: 2, text: "Beritahu nomor HP yang terdaftar."),

          StepItem(number: 3, text: "Pilih nominal top up."),

          StepItem(number: 4, text: "Bayar sesuai nominal."),

          StepItem(number: 5, text: "Kasir akan memproses transaksi."),

          StepItem(number: 6, text: "Saldo akan bertambah otomatis."),

          StepItem(number: 7, text: "Simpan bukti pembayaran."),
        ],
      ),
    );
  }
}

class StepItem extends StatelessWidget {
  final int number;
  final String text;

  const StepItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.green,
            child: Text("$number", style: const TextStyle(color: Colors.white)),
          ),

          const SizedBox(width: 15),

          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
