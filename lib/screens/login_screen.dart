import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'register_screen.dart';
import '../database/database_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool _obscurePassword = true;

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  String email = "";
  String password = "";

  String emailError = "";
String passwordError = "";

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
    emailController.dispose();
    passwordController.dispose();
    _eyeController.dispose();
    super.dispose();
  }

  bool validateEmail(String value) {
    final regex = RegExp(
      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
    );

    return regex.hasMatch(value);
  }

  void checkEmail(String value) {
    setState(() {
      email = value;

      emailError =
          validateEmail(value) || value.isEmpty
              ? ""
              : "Email tidak valid";
    });
  }

  void togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;

      if (_obscurePassword) {
        _eyeController.reverse();
      } else {
        _eyeController.forward();
      }
    });
  }

  Future<void> login() async {
  setState(() {
    emailError = "";
    passwordError = "";
  });

  final email = emailController.text.trim();
  final password = passwordController.text;

  bool isValid = true;

  if (email.isEmpty) {
    emailError = "Email wajib diisi";
    isValid = false;
  } else if (!validateEmail(email)) {
    emailError = "Format email tidak valid";
    isValid = false;
  }

  if (password.isEmpty) {
    passwordError = "Password wajib diisi";
    isValid = false;
  }

  setState(() {});

  if (!isValid) return;

  final user =
      await DatabaseHelper.instance.loginUser(
    email: email,
    password: password,
  );

  if (user != null) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const DashboardScreen(),
    ),
  );
} else {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "Email atau Password salah",
      ),
    ),
  );
}

  if (!mounted) return;

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const DashboardScreen(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F3),

      body: Column(
        children: [
          Container(
            height: 280,
            width: double.infinity,

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff2E7D32),
                  Color(0xff43A047),
                ],
              ),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),

            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.recycling,
                  size: 90,
                  color: Colors.white,
                ),

                SizedBox(height: 15),

                Text(
                  "EchoLink",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Bergabung dengan kami, Bersama kita jaga Lingkungan",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25),

              child: Column(
                children: [
                  const SizedBox(height: 20),

                  const Text(
                    "Selamat Datang 👋",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Masuk untuk melanjutkan",
                  ),

                  const SizedBox(height: 30),

                  // EMAIL
                  TextField(
                    controller: emailController,
                    onChanged: checkEmail,

                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email),

                      errorText:
                          emailError.isEmpty
                              ? null
                              : emailError,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // PASSWORD
                  TextField(
                    controller: passwordController,
                    obscureText: _obscurePassword,

                    decoration: InputDecoration(
  labelText: "Password",

  errorText: passwordError.isEmpty
      ? null
      : passwordError,

  prefixIcon: const Icon(Icons.lock),

                      suffixIcon: GestureDetector(
                        onTap: togglePassword,

                        child: AnimatedSwitcher(
                          duration:
                              const Duration(
                                milliseconds: 200,
                              ),

                          transitionBuilder:
                              (child, anim) =>
                                  FadeTransition(
                                    opacity: anim,
                                    child: child,
                                  ),

                          child: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,

                            key: ValueKey(
                              _obscurePassword,
                            ),
                          ),
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(
                                  0xff2E7D32,
                                ),
                          ),

                      onPressed: login,

                      child: const Text(
                        "MASUK",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const RegisterScreen(),
                        ),
                      );
                    },

                    child: const Text(
                      "Belum punya akun? Daftar",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}