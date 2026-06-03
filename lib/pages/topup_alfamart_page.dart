import 'package:flutter/material.dart';
import 'topup_indomaret_page.dart';

class TopupAlfamartPage extends StatelessWidget {
  const TopupAlfamartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alfamart")),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            "Cara isi EcoPay 🪙",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),

          StepItem(number: 1, text: "Datangi kasir Alfamart."),
          StepItem(number: 2, text: "Beritahu nomor HP akun EcoPay."),
          StepItem(number: 3, text: "Pilih nominal top up."),
          StepItem(number: 4, text: "Bayar sesuai nominal."),
          StepItem(number: 5, text: "Kasir memproses transaksi."),
          StepItem(number: 6, text: "Saldo masuk otomatis."),
          StepItem(number: 7, text: "Simpan struk pembayaran."),
        ],
      ),
    );
  }
}
