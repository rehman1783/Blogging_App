import 'package:flutter/material.dart';
import 'package:blogging_app/app/app_colors.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: const Text(
          'Blog Detail',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blog Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
              child: Image.asset(
                "assets/images/code_lptp.jpg",
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Blog Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mastering Flutter UI Design",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Author Info
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          "https://randomuser.me/api/portraits/men/45.jpg",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Abdul Rehman",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            "July 18, 2025",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "In this blog, we will explore how to design beautiful and responsive UIs using Flutter. "
                    "You'll learn how to use layout widgets effectively, work with themes, create reusable components, "
                    "and adopt clean design practices that elevate your mobile app experience.\n\n"
                    "Topics covered:\n"
                    "• Using MediaQuery and LayoutBuilder\n"
                    "• Responsive design principles\n"
                    "• Theme and color customization\n"
                    "• Custom reusable widgets\n"
                    "• Clean architecture for UI\n\n"
                    "By the end of this blog, you'll be able to create a consistent and scalable UI architecture "
                    "that adapts well to different screen sizes and devices.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
