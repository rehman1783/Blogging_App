import 'package:blogging_app/app/app_colors.dart';
import 'package:blogging_app/core/widgets/blog_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<String?> _getUserImage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      return doc.data()?['profileImage'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/blogverse_logo.png", height: 35),
                  Text(
                    'BlogVerse',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  
                  /// Circle Avatar with user image or default
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                    child: FutureBuilder<String?>(
                      future: _getUserImage(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                          );
                        }
                        final imageUrl = snapshot.data;
                        return CircleAvatar(
                          radius: 20,
                          backgroundImage: (imageUrl != null && imageUrl.isNotEmpty)
                              ? NetworkImage(imageUrl)
                              : const AssetImage("assets/images/blogverse_logo.png") as ImageProvider,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            /// Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Text(
                "Discover Blogs",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            /// Blog list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: 5, // Demo
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
