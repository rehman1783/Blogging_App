import 'package:blogging_app/app/app_colors.dart';
import 'package:blogging_app/app/app_constants.dart';
import 'package:blogging_app/app/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // ✅ Fetch user's document from Firestore
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          final role = userDoc.data()?['role'];

          if (role == 'admin') {
            Navigator.pushReplacementNamed(context, AppRoutes.adminDashboard);
          } else if (role == 'writer') {
            Navigator.pushReplacementNamed(context, AppRoutes.writerDashboard);
          } else {
            Navigator.pushReplacementNamed(context, AppRoutes.readerDashboard);
          }
        } else {
          // User doc not found, send to login
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      } catch (e) {
        // Error fetching user role
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    } else {
      // ❌ Not logged in
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/blogverse_logo.png',
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              AppStrings.appName,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
