import 'package:blogging_app/app/app_colors.dart';
import 'package:blogging_app/app/app_constants.dart';
import 'package:blogging_app/app/app_routes.dart';
import 'package:blogging_app/core/widgets/custom_button.dart';
import 'package:blogging_app/core/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _loginUser() async {
    setState(() => _isLoading = true);
    try {
      // Sign in with Firebase Auth
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Fetch user role from Firestore
   final userDoc = await FirebaseFirestore.instance
    .collection('users')
    .doc(credential.user!.uid)
    .get();

if (!userDoc.exists) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('User data not found. Please contact support.')),
  );
  return;
}

final role = userDoc['role'];


      if (role == 'admin') {
        Navigator.pushReplacementNamed(context, AppRoutes.adminDashboard);
      } else if (role == 'writer') {
        Navigator.pushReplacementNamed(context, AppRoutes.writerDashboard);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.readerDashboard);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Login failed')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.screen),
        child: Column(
          children: [
            const SizedBox(height: 160),
            Image.asset('assets/images/blogverse_logo.png', height: 90),
            const SizedBox(height: 20),
            const Text(
              'Welcome Back 👋',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            const SizedBox(height: 8),
            const Text('Login to your account', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 30),

            CustomTextField(label: 'Email', icon: Icons.email_outlined, controller: _emailController),
            const SizedBox(height: 20),
            CustomTextField(label: 'Password', icon: Icons.lock_outline, isPassword: true, controller: _passwordController),
            const SizedBox(height: 30),

            _isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    label: 'Login',
                    onPressed: _loginUser,
                  ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.signup),
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
