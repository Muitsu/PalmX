// main.dart or profile_screen.dart
import 'package:flutter/material.dart';
import 'package:palmx/features/settings/edit_field_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // Your user data state variables
  String userFullName = "Asnawi";
  String userEmail = "asnawi@gmail.com";

  // Reusable function to handle navigation to the edit screen
  void _editField(
    String title,
    String currentValue,
    Function(String) onUpdate,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditFieldPage(
          title: title,
          initialValue: currentValue,
          onSave: onUpdate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Theme colors (adjust as needed for closer match)
    const primaryTextColor = Colors.black;
    const secondaryTextColor = Colors.grey;
    const accentColor = Colors.orangeAccent;

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
                    Positioned(
                      bottom: -5,
                      right: -5,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white.withValues(alpha: 0.8),
                          child: const Icon(
                            Icons.edit_outlined,
                            size: 16,
                            color: accentColor,
                          ),
                        ),
                      ),
                    ),
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
            _buildEditableInfoTile(
              "Import Data",
              userFullName,
              (val) => setState(() => userFullName = val),
            ),
            _buildEditableInfoTile(
              "Export Data",
              userEmail,
              (val) => setState(() => userEmail = val),
            ),

            const SizedBox(height: kToolbarHeight + 20),
          ],
        ),
      ),
    );
  }

  // Helper method for regular non-editable info tiles (for context and the "linked accounts" part)
  Widget _buildInfoTile({
    required String label,
    required String value,
    required Function() onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.person, color: Colors.grey[400]),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(value, style: const TextStyle(color: Colors.grey)),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey[400],
      ),
    );
  }

  // Reusable method for editable info tiles - integrates with _editField
  Widget _buildEditableInfoTile(
    String label,
    String value,
    Function(String) onUpdate,
  ) {
    return _buildInfoTile(
      label: label,
      value: value,
      onTap: () => _editField(label, value, onUpdate),
    );
  }
}
