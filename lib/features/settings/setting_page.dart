// main.dart or profile_screen.dart
import 'package:flutter/material.dart';
import 'package:palmx/features/settings/provider/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // Your user data state variables
  String userFullName = "Asnawi";
  String userEmail = "asnawi@gmail.com";
  late SettingProvider _settingProvider;

  @override
  void initState() {
    super.initState();
    _settingProvider = context.read<SettingProvider>();
  }

  @override
  Widget build(BuildContext context) {
    // Theme colors (adjust as needed for closer match)
    const primaryTextColor = Colors.black;
    const secondaryTextColor = Colors.grey;
    // const accentColor = Colors.orangeAccent;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: primaryTextColor)),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Header (matches image)
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.orange[800],
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    // Positioned(
                    //   bottom: -5,
                    //   right: -5,
                    //   child: Container(
                    //     padding: const EdgeInsets.all(3),
                    //     decoration: const BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: Colors.white,
                    //     ),
                    //     child: CircleAvatar(
                    //       radius: 12,
                    //       backgroundColor: Colors.white.withValues(alpha: 0.8),
                    //       child: const Icon(
                    //         Icons.edit_outlined,
                    //         size: 16,
                    //         color: accentColor,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  userFullName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor,
                  ),
                ),
                Text(
                  userEmail, // Display dynamic user email
                  style: const TextStyle(color: secondaryTextColor),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Personal Information section (where editing happens)
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Data Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 10),

            // Reusable editable ListTiles (This is where your logic is integrated)
            _buildInfoTile(
              label: "Import Data",
              icon: Icons.file_download,
              value: "Import your database from a file",
              onTap: () => _settingProvider.importDatabase(context),
            ),
            _buildInfoTile(
              label: "Export Data",
              icon: Icons.file_upload,
              value: "Export your database to a file",
              onTap: () => _settingProvider.exportDatabase(context),
            ),

            const SizedBox(height: kToolbarHeight + 20),
          ],
        ),
      ),
    );
  }

  // Helper method for regular non-editable info tiles (for context and the "linked accounts" part)
  Widget _buildInfoTile({
    required IconData? icon,
    required String label,
    required String value,
    required void Function() onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Icon(icon, color: Colors.grey[400]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(value, style: const TextStyle(color: Colors.grey)),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey[400],
      ),
    );
  }
}
