import 'package:blogging_app/app/app_colors.dart';
import 'package:blogging_app/app/app_constants.dart';
import 'package:blogging_app/app/app_routes.dart';
import 'package:blogging_app/core/widgets/custom_button.dart';
import 'package:blogging_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedRole = 'reader'; // Default role
  bool _isLoading = false;

  Future<void> _signUpUser() async {
    setState(() => _isLoading = true);
    try {
      // Firebase Auth SignUp
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Save user data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'role': _selectedRole,
        'createdAt': Timestamp.now(),
      });

      // Navigate based on role
      if (_selectedRole == 'admin') {
        Navigator.pushReplacementNamed(context, AppRoutes.adminDashboard);
      } else if (_selectedRole == 'writer') {
        Navigator.pushReplacementNamed(context, AppRoutes.writerDashboard);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.readerDashboard);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Signup failed')),
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
            const SizedBox(height: 100),

            Image.asset('assets/images/blogverse_logo.png', height: 90),
            const SizedBox(height: 20),

            const Text(
              'Join BlogVerse 📝',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            const SizedBox(height: 8),
            const Text('Create an account to get started', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 30),

            CustomTextField(label: 'Full Name', icon: Icons.person_outline, controller: _nameController),
            const SizedBox(height: 20),
            CustomTextField(label: 'Email', icon: Icons.email_outlined, controller: _emailController),
            const SizedBox(height: 20),
            CustomTextField(label: 'Password', icon: Icons.lock_outline, isPassword: true, controller: _passwordController),
            const SizedBox(height: 20),

            // Role Dropdown
            DropdownButtonFormField<String>(
              value: _selectedRole,
          decoration: InputDecoration(
  labelText: "Select Role",
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.border, width: 2),
    borderRadius: BorderRadius.circular(12),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primary, width: 2),
    borderRadius: BorderRadius.circular(12),
  ),
  prefixIcon: const Icon(Icons.person_pin),
),

              items: const [
                DropdownMenuItem(value: 'reader', child: Text('Reader')),
                DropdownMenuItem(value: 'writer', child: Text('Writer')),
                DropdownMenuItem(value: 'admin', child: Text('Admin')),
              ],
              onChanged: (value) => setState(() => _selectedRole = value ?? 'reader'),
            ),
            const SizedBox(height: 30),

            _isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    label: 'Sign Up',
                    onPressed: _signUpUser,
                  ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
