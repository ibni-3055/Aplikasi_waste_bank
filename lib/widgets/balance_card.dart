import 'package:flutter/material.dart';
import '../pages/history_page.dart';
import '../pages/topup_page.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 25,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Stack(
        children: [
          Positioned(
            right: -25,
            top: -25,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.03),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "EcoPay",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      const SizedBox(width: 4),

                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Color(0xff16A34A),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.eco,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 8),

                      const Text(
                        "Saldo",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffE5E7EB)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          color: Color(0xff16A34A),
                          size: 18,
                        ),

                        SizedBox(width: 6),

                        Text(
                          "Voucher",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 2),

                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              const Row(
                children: [
                  Text(
                    "Total Saldo",
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  ),

                  SizedBox(width: 6),

                  Icon(Icons.visibility_off, size: 18, color: Colors.black54),
                ],
              ),

              const SizedBox(height: 4),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text(
                      "Rp",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  Text(
                    "500.000",
                    style: TextStyle(
                      fontSize: 42,
                      height: 1,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff111827),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              const Row(
                children: [
                  Text(
                    "Paket Aktif : Bulanan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),

                  SizedBox(width: 6),

                  Icon(Icons.recycling, color: Color(0xff16A34A), size: 20),
                ],
              ),

              const SizedBox(height: 2),

              const Text(
                "Sisa 7 Pengangkutan",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),

              const SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const LinearProgressIndicator(
                  value: 0.7,
                  minHeight: 10,
                  backgroundColor: Color(0xffE5E7EB),
                  valueColor: AlwaysStoppedAnimation(Color(0xff16A34A)),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const TopupPage()),
                        );
                      },
                      child: menuItem(
                        Icons.account_balance_wallet_outlined,
                        "Top Up",
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HistoryPage(),
                          ),
                        );
                      },
                      child: menuItem(Icons.history, "History"),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(child: menuItem(Icons.recycling, "Eco Point")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menuItem(IconData icon, String title) {
    return Container(
      height: 54,

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffE5E7EB)),
        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: const Color(0xff16A34A)),

          const SizedBox(width: 6),

          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
