import 'package:blogging_app/app/app_colors.dart';
import 'package:blogging_app/app/app_routes.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
       Navigator.pushNamed(context, AppRoutes.blogDetail);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Network image with fallback
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                "assets/images/code_lptp.jpg",
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
               
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter Clean Architecture",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Learn how to structure your Flutter project for scalability, maintainability, and testing.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 14,
                        backgroundImage: NetworkImage(
                          "https://randomuser.me/api/portraits/men/11.jpg",
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Abdul Rehman",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "• 5 min read",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
