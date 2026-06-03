import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F3),

      appBar: AppBar(
        title: const Text("Notifikasi"),
        backgroundColor: const Color(0xff2E7D32),
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(15),

        children: [
          _notificationCard(
            Icons.check_circle,
            Colors.green,
            "Pengajuan diterima",
          ),

          _notificationCard(
            Icons.local_shipping,
            Colors.orange,
            "Petugas menuju lokasi",
          ),

          _notificationCard(
            Icons.done_all,
            Colors.blue,
            "Sampah berhasil diambil",
          ),
        ],
      ),
    );
  }

  Widget _notificationCard(IconData icon, Color color, String title) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
      ),
    );
  }
}
