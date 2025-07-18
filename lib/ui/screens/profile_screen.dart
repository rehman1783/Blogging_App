import 'package:blogging_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile", style: TextStyle(color: Colors.white,
        fontSize: 22, fontWeight: FontWeight.bold
        )),
        backgroundColor: AppColors.primary,
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 20),
            _buildStatCard(),
            const SizedBox(height: 20),
            _buildSettings(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      color: AppColors.background,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/32.jpg"),
          ),
          const SizedBox(height: 12),
          const Text(
            "Abdul Rehman",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          ),
          const Text(
            "flutter.dev@gmail.com",
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSingleStat("Posts", "23"),
          _buildSingleStat("Followers", "120"),
          _buildSingleStat("Following", "80"),
        ],
      ),
    );
  }

  Widget _buildSingleStat(String title, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildSettings(BuildContext context) {
    return Column(
      children: [
        _buildSettingsTile(Icons.edit, "Edit Profile", () {}),
        _buildSettingsTile(Icons.notifications, "Notifications", () {}),
        _buildSettingsTile(Icons.settings, "Settings", () {}),
        _buildSettingsTile(Icons.logout, "Logout", () {
          // Add your logout logic here
        }),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
