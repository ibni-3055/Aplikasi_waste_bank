import 'package:flutter/material.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  String selectedMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F8),

      appBar: AppBar(
        backgroundColor: const Color(0xffEEF4EA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Isi Saldo EcoPay",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: const Color(0xff22C55E),
            child: const Row(
              children: [
                Icon(Icons.local_offer, color: Colors.white, size: 18),

                SizedBox(width: 8),

                Expanded(
                  child: Text(
                    "Gratis Admin! Isi Saldo mulai Rp25.000",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          paymentCard(
            title: "Indomaret / i.Saku",
            icon: Icons.store,
            value: "indomaret",
          ),

          paymentCard(
            title: "Alfamart / Alfagift / Dan+Dan",
            icon: Icons.shopping_bag,
            value: "alfamart",
          ),

          ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            leading: const Icon(Icons.credit_card),
            title: const Text(
              "Kartu Debit",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            children: [
              paymentCard(
                title: "Kartu Debit Kamu",
                icon: Icons.credit_card,
                value: "debit",
                margin: false,
              ),
            ],
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: selectedMethod.isEmpty
                      ? Colors.grey.shade300
                      : const Color(0xff22C55E),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: selectedMethod.isEmpty
                    ? null
                    : () {
                        if (selectedMethod == "indomaret") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const TopupGuidePage(title: "Indomaret"),
                            ),
                          );
                        }

                        if (selectedMethod == "alfamart") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const TopupGuidePage(title: "Alfamart"),
                            ),
                          );
                        }

                        if (selectedMethod == "debit") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Fitur kartu debit belum tersedia"),
                            ),
                          );
                        }
                      },
                child: const Text(
                  "Konfirmasi",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentCard({
    required String title,
    required IconData icon,
    required String value,
    bool margin = true,
  }) {
    final isSelected = selectedMethod == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = value;
        });
      },
      child: Container(
        margin: margin
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 6)
            : const EdgeInsets.fromLTRB(16, 0, 16, 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: isSelected ? const Color(0xff22C55E) : Colors.grey.shade300,
            width: 1.5,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xff22C55E)),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: const Color(0xff22C55E),
            ),
          ],
        ),
      ),
    );
  }
}

class TopupGuidePage extends StatelessWidget {
  final String title;

  const TopupGuidePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(title: Text(title), centerTitle: true),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Cara isi EcoPay 🪙",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 10),

          Text(
            "Biaya admin Rp2.000 • Minimal top up Rp20.000",
            style: TextStyle(color: Colors.blue.shade700),
          ),

          const SizedBox(height: 25),

          step(1, "Minta bantuan kasir untuk mengisi EcoPay."),
          step(2, "Beritahu nomor HP yang terdaftar."),
          step(3, "Pilih nominal top up yang diinginkan."),
          step(4, "Bayar sesuai nominal yang dipilih."),
          step(5, "Kasir akan memproses transaksi."),
          step(6, "Saldo akan bertambah otomatis."),
          step(7, "Simpan bukti pembayaran."),
        ],
      ),
    );
  }

  Widget step(int number, String text) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xff22C55E),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "$number",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              if (number != 7)
                Container(width: 3, height: 45, color: Colors.green.shade300),
            ],
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 25),
              child: Text(
                text,
                style: const TextStyle(height: 1.4, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
