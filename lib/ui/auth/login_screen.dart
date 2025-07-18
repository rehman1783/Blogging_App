import 'package:blogging_app/app/app_colors.dart';
import 'package:blogging_app/app/app_constants.dart';
import 'package:blogging_app/app/app_routes.dart';
import 'package:blogging_app/app/app_theme.dart';
import 'package:blogging_app/core/widgets/custom_button.dart';
import 'package:blogging_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.screen),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset('assets/images/blogverse_logo.png', height: 90),
            const SizedBox(height: 20),
            const Text(
              'Welcome Back 👋',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            const SizedBox(height: 8),
            const Text('Login to your account', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 30),

            const CustomTextField(label: 'Email', icon: Icons.email_outlined),
            const SizedBox(height: 20),
            const CustomTextField(label: 'Password', icon: Icons.lock_outline, isPassword: true),
            const SizedBox(height: 30),

            CustomButton(
              label: 'Login',
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              },
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
