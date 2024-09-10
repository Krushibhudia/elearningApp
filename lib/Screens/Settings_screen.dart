import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Account Settings
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.blueAccent),
              title: Text('Account Settings'),
              onTap: () {
                // Navigate to account settings
              },
            ),
            Divider(),

            // Notifications
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.blueAccent),
              title: Text('Notifications'),
              onTap: () {
                // Navigate to notifications settings
              },
            ),
            Divider(),

            // Privacy
            ListTile(
              leading: Icon(Icons.lock, color: Colors.blueAccent),
              title: Text('Privacy'),
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            Divider(),

            // Help & Support
            ListTile(
              leading: Icon(Icons.help, color: Colors.blueAccent),
              title: Text('Help & Support'),
              onTap: () {
                // Navigate to help and support
              },
            ),
            Divider(),

            // Logout
            ListTile(
              leading: Icon(Icons.logout, color: Colors.redAccent),
              title: Text('Logout'),
              onTap: () {
                // Handle logout action
              },
            ),
          ],
        ),
      ),
    );
  }
}
