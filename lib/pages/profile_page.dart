import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F3),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50),

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff2E7D32), Color(0xff43A047)],
              ),
            ),

            child: const Column(
              children: [
                CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),

                SizedBox(height: 10),

                Text(
                  "Ibni Iftikhar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text("ibni@email.com", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _menu(Icons.person_outline, "Edit Profil"),

          _menu(Icons.info_outline, "Tentang EchoLink"),

          _menu(Icons.help_outline, "Bantuan"),

          _menu(Icons.logout, "Logout"),
        ],
      ),
    );
  }

  static Widget _menu(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
