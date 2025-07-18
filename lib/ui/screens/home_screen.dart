import 'package:blogging_app/app/app_colors.dart';
import 'package:blogging_app/core/widgets/blog_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/blogverse_logo.png", height: 35),
                  Text('BlogVerse',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      )),
                 GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/profile'),
                   child: CircleAvatar(
                     backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/12.jpg"),
                   ),
                 ),
                ],
              ),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Text(
                "Discover Blogs",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // Blog list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: 5, // demo
                itemBuilder: (_, index) => const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: BlogCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
