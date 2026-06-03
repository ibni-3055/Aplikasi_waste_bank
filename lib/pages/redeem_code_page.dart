import 'package:flutter/material.dart';
import 'redeem_success_page.dart';

class RedeemCodePage extends StatefulWidget {
  const RedeemCodePage({super.key});

  @override
  State<RedeemCodePage> createState() =>
      _RedeemCodePageState();
}

class _RedeemCodePageState
    extends State<RedeemCodePage> {

  final TextEditingController controller =
      TextEditingController();

  bool loading = false;

  String codeError = "";

  Future<void> redeem() async {

    setState(() {
      codeError = "";
    });

    if (controller.text.trim().isEmpty) {
      setState(() {
        codeError = "Kode hadiah wajib diisi";
      });
      return;
    }

    setState(() {
      loading = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const RedeemSuccessPage(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(
              "Pembayaran",
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),

                const Text(
                  "Penukaran Kode\nHadiah EcoLink",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                TextField(
                  controller: controller,

                  decoration: InputDecoration(
                    hintText:
                        "Masukkan Kode Hadiah",

                    errorText: codeError.isEmpty
                        ? null
                        : codeError,

                    border:
                        const OutlineInputBorder(),
                  ),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(
                        0xff1FA64B,
                      ),
                    ),

                    onPressed: redeem,

                    child: const Text(
                      "Tukarkan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        if (loading)
          Container(
            color: Colors.black38,

            child: const Center(
              child: Card(
                child: Padding(
                  padding:
                      EdgeInsets.all(25),

                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min,

                    children: [
                      CircularProgressIndicator(),

                      SizedBox(height: 15),

                      Text(
                        "Mohon Tunggu\nSebentar",
                        textAlign:
                            TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}