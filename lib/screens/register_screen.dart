import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../pages/location_setup_page.dart';
import '../database/database_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  String password = "";
  String strengthText = "";

  String namaError = "";
  String emailError = "";
  String passwordError = "";
  String confirmPasswordError = "";

  Color strengthColor = Colors.grey;

  late AnimationController _eyeController;

  @override
  void initState() {
    super.initState();
    _eyeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
     namaController.dispose();
  emailController.dispose();
  passwordController.dispose();
  confirmPasswordController.dispose();
    _eyeController.dispose();
    super.dispose();
  }

  bool validateEmail(String value) {
  final regex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  return regex.hasMatch(value);
}

  void checkStrength(String value) {
    password = value;

    setState(() {
      if (value.length < 6) {
        strengthText = "Weak";
        strengthColor = Colors.red;
      } else if (value.length < 10) {
        strengthText = "Medium";
        strengthColor = Colors.orange;
      } else {
        strengthText = "Strong";
        strengthColor = Colors.green;
      }
    });
  }

  void togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void toggleConfirm() {
    setState(() {
      _obscureConfirm = !_obscureConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 260,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff2E7D32), Color(0xff43A047)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_add, size: 90, color: Colors.white),
                  SizedBox(height: 15),
                  Text(
                    "Buat Akun Baru",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Bergabung dengan kami, Bersama kita jaga Lingkungan",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  TextField(
  controller: namaController,
  decoration: InputDecoration(
    labelText: "Nama Lengkap",
    prefixIcon: const Icon(Icons.person),

    errorText: namaError.isEmpty
        ? null
        : namaError,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
),

                  const SizedBox(height: 15),

                  TextField(
  controller: emailController,
  decoration: InputDecoration(
    labelText: "Email",
    prefixIcon: const Icon(Icons.email),

    errorText: emailError.isEmpty
        ? null
        : emailError,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
),

const SizedBox(height: 15),

                  const SizedBox(height: 15),

                  // PASSWORD
                  TextField(
  controller: passwordController,
  obscureText: _obscurePassword,
  onChanged: checkStrength,

  decoration: InputDecoration(
    labelText: "Password",
    prefixIcon: const Icon(Icons.lock),

    errorText: passwordError.isEmpty
        ? null
        : passwordError,

    suffixIcon: IconButton(
      icon: Icon(
        _obscurePassword
            ? Icons.visibility_off
            : Icons.visibility,
      ),
      onPressed: togglePassword,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
),

                  const SizedBox(height: 8),

                  // PASSWORD STRENGTH
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Strength: $strengthText",
                      style: TextStyle(
                        color: strengthColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // CONFIRM PASSWORD
                  TextField(
  controller: confirmPasswordController,
  obscureText: _obscureConfirm,

  decoration: InputDecoration(
    labelText: "Konfirmasi Password",
    prefixIcon: const Icon(Icons.lock_outline),

    errorText: confirmPasswordError.isEmpty
        ? null
        : confirmPasswordError,

    suffixIcon: IconButton(
      icon: Icon(
        _obscureConfirm
            ? Icons.visibility_off
            : Icons.visibility,
      ),
      onPressed: toggleConfirm,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2E7D32),
                      ),
                      onPressed: () async {
  setState(() {
    namaError = "";
    emailError = "";
    passwordError = "";
    confirmPasswordError = "";
  });

  bool isValid = true;

  if (namaController.text.trim().isEmpty) {
    namaError = "Nama lengkap wajib diisi";
    isValid = false;
  }

  if (emailController.text.trim().isEmpty) {
    emailError = "Email wajib diisi";
    isValid = false;
  } else if (!validateEmail(emailController.text.trim())) {
    emailError = "Format email tidak valid";
    isValid = false;
  }

  if (passwordController.text.isEmpty) {
    passwordError = "Password wajib diisi";
    isValid = false;
  }

  if (confirmPasswordController.text.isEmpty) {
    confirmPasswordError =
        "Konfirmasi password wajib diisi";
    isValid = false;
  } else if (passwordController.text !=
      confirmPasswordController.text) {
    confirmPasswordError =
        "Konfirmasi password tidak cocok";
    isValid = false;
  }

  setState(() {});

  if (!isValid) return;

  final emailSudahAda =
      await DatabaseHelper.instance.emailExists(
    emailController.text.trim(),
  );

  if (emailSudahAda) {
    setState(() {
      emailError = "Email sudah terdaftar";
    });
    return;
  }

  await DatabaseHelper.instance.registerUser(
    nama: namaController.text.trim(),
    email: emailController.text.trim(),
    password: passwordController.text,
  );

  print("User berhasil disimpan");

  if (!mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "Registrasi berhasil",
      ),
    ),
  );

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) =>
          const LocationSetupPage(),
    ),
  );
},
                      child: const Text(
                        "DAFTAR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text("Sudah punya Akun? Masuk"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
