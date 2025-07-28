import 'package:blogging_app/app/app_colors.dart';
import 'package:blogging_app/ui/screens/add_post_screen.dart';
import 'package:blogging_app/ui/screens/home_screen.dart';
import 'package:blogging_app/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class WriterDashboard extends StatefulWidget {
  const WriterDashboard({super.key});

  @override
  State<WriterDashboard> createState() => _WriterDashboardState();
}

class _WriterDashboardState extends State<WriterDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    AddPostScreen(),
    ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              final isSelected = _selectedIndex == index;
              final iconList = [
                Icons.home_rounded,
                Icons.add_box_rounded,
                Icons.person_rounded,
              ];

              return GestureDetector(
                onTap: () => _onTap(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary.withOpacity(0.3) : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    iconList[index],
                    size: 34,
                    color: isSelected ? AppColors.primary : AppColors.textSecondary,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
