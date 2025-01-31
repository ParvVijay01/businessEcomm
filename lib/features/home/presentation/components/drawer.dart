import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(String) onItemTap; // Callback for menu item selection

  const CustomDrawer({super.key, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  // backgroundImage: AssetImage("assets/profile.jpg"), // Replace with your image
                ),
                SizedBox(height: 10),
                Text("User Name",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                Text("user@example.com",
                    style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(Icons.home, "Home", context),
                _buildDrawerItem(Icons.person, "Profile", context),
                _buildDrawerItem(Icons.settings, "Settings", context),
                _buildDrawerItem(Icons.logout, "Logout", context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom method to create drawer items
  Widget _buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.tertiary),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pop(context); // Close drawer
        onItemTap(title); // Callback to handle navigation
      },
    );
  }
}
