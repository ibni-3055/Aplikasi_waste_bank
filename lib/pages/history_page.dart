import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),

      appBar: AppBar(
        backgroundColor: const Color(0xffE8ECE0),
        elevation: 1,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text(
          "Histori transaksi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HistoryCard(
            title: "Langganan 1 Bulan",
            description:
                "Anda berlangganan paket 1 bulan menggunakan Voucher EcoPay",
            amount: "-1 Voucher Langganan 1 bulan",
            isExpense: true,
          ),

          SizedBox(height: 16),

          HistoryCard(
            title: "Pengisian Saldo",
            description: "Pengisian saldo di Alfamart telah berhasil dilakukan",
            amount: "+Rp500.000 Telah masuk ke akunmu",
            isExpense: false,
          ),

          SizedBox(height: 16),

          HistoryCard(
            title: "Pick Up Sekarang",
            description:
                "Anda melakukan Pick Up sekarang menggunakan EcoPay otomatis dipotong dari saldo mu.",
            amount: "-Rp17.000 Dari saldo EcoPay",
            isExpense: true,
          ),

          SizedBox(height: 16),

          HistoryCard(
            title: "Pick Up Sekarang",
            description:
                "Anda melakukan Pick Up sekarang menggunakan EcoPay otomatis dipotong dari saldo mu.",
            amount: "-Rp20.000 Dari saldo EcoPay",
            isExpense: true,
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String title;
  final String description;
  final String amount;
  final bool isExpense;

  const HistoryCard({
    super.key,
    required this.title,
    required this.description,
    required this.amount,
    required this.isExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: const Color(0xff43D17D), width: 1.3),

        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black54, fontSize: 13),
                  ),

                  const Spacer(),

                  Text(
                    amount,
                    style: TextStyle(
                      color: isExpense ? Colors.red : Colors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Column(
              children: [
                Expanded(
                  child: Container(
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.local_shipping,
                      size: 50,
                      color: Color(0xff43D17D),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff43D17D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Lihat Detailnya",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
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
