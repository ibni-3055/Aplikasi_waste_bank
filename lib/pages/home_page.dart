import 'package:flutter/material.dart';

import '../widgets/header_home.dart';
import '../widgets/balance_card.dart';
import '../widgets/service_card.dart';
import '../widgets/event_banner.dart';
import '../widgets/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F8),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderHome(),

            Transform.translate(
  offset: const Offset(0, -75),
  child: const Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: BalanceCard(),
  ),
),

Transform.translate(
  offset: const Offset(0, -45),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: SectionTitle(
            title: "Layanan Utama",
          ),
        ),

        const SizedBox(height: 16),

        const ServiceCard(
          title: "Pickup Berlangganan",
          subtitle: "Lebih hemat & otomatis setiap minggu",
          discount: true,
        ),

        const SizedBox(height: 16),

        const ServiceCard(
          title: "Pickup Sekarang",
          subtitle: "Petugas datang hari ini",
          blueButton: true,
        ),

        const SizedBox(height: 24),

        const Align(
          alignment: Alignment.centerLeft,
          child: SectionTitle(
            title: "Event",
          ),
        ),

        const SizedBox(height: 12),

        const EventBanner(),
      ],
    ),
  ),
),

          
          ],
        ),
      ),
    );
  }
}
