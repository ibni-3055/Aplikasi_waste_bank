import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';

class LocationSetupPage extends StatefulWidget {
  const LocationSetupPage({super.key});

  @override
  State<LocationSetupPage> createState() => _LocationSetupPageState();
}

class _LocationSetupPageState extends State<LocationSetupPage> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  String selectedCategory = "Rumah";

  final List<String> categories = [
    "Rumah",
    "Kantor",
    "Sekolah",
    "Kos",
    "Apartemen",
  ];

  @override
  void dispose() {
    locationController.dispose();
    provinceController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    super.dispose();
  }

  void saveLocation() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(color: Color(0xff22C55E)),
                SizedBox(height: 20),
                Text("Mohon Tunggu Sebentar", textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pop(context);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Color(0xff22C55E),
                size: 80,
              ),

              const SizedBox(height: 15),

              const Text(
                "Berhasil",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Lokasimu berhasil ditambahkan",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff22C55E),
                  ),
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DashboardScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Lanjut",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F3),

      body: Column(
        children: [
          // MAP AREA
          SizedBox(
            height: 320,
            child: Stack(
              children: [
                Container(
                  height: 320,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/map_lokasi.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  height: 320,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.35),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 55,
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,

              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),

              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    const Text(
                      "Tentukan Lokasi",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff22C55E),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Tentukan lokasi rumahmu untuk memudahkan proses penjemputan sampah.",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Alamat Lengkap",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      controller: locationController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Contoh: Jl. Raya Bogor No. 10",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 45),
                          child: Icon(Icons.home_outlined),
                        ),
                        filled: true,
                        fillColor: const Color(0xffF5F7F3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: provinceController,
                            decoration: InputDecoration(
                              labelText: "Provinsi",
                              prefixIcon: const Icon(Icons.map_outlined),
                              filled: true,
                              fillColor: const Color(0xffF5F7F3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: TextField(
                            controller: cityController,
                            decoration: InputDecoration(
                              labelText: "Kota",
                              prefixIcon: const Icon(Icons.location_city),
                              filled: true,
                              fillColor: const Color(0xffF5F7F3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      controller: postalCodeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Kode Pos",
                        prefixIcon: const Icon(
                          Icons.markunread_mailbox_outlined,
                        ),
                        filled: true,
                        fillColor: const Color(0xffF5F7F3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xffECFDF3),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xff22C55E)),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.info_outline, color: Color(0xff22C55E)),

                          SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              "Pastikan alamat sesuai agar proses pickup sampah berjalan lebih cepat.",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Kategori Tempat",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 12),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemBuilder: (context, index) {
                        final item = categories[index];
                        final selected = selectedCategory == item;

                        IconData icon;

                        switch (item) {
                          case "Rumah":
                            icon = Icons.home;
                            break;
                          case "Kantor":
                            icon = Icons.business;
                            break;
                          case "Sekolah":
                            icon = Icons.school;
                            break;
                          case "Kos":
                            icon = Icons.apartment;
                            break;
                          default:
                            icon = Icons.location_city;
                        }

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = item;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            decoration: BoxDecoration(
                              color: selected
                                  ? const Color(0xff22C55E)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: selected
                                    ? const Color(0xff22C55E)
                                    : Colors.grey.shade300,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icon,
                                  color: selected
                                      ? Colors.white
                                      : const Color(0xff22C55E),
                                ),

                                const SizedBox(width: 8),

                                Text(
                                  item,
                                  style: TextStyle(
                                    color: selected
                                        ? Colors.white
                                        : Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 25),

                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff22C55E).withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: saveLocation,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff22C55E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Selanjutnya",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
