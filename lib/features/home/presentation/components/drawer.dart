import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

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
        _navigateToScreen(title, context); // Callback to handle navigation
      },
    );
  }

  void _navigateToScreen(String title, BuildContext context) {
    switch (title) {
      case "Home":
        Navigator.pushNamed(context, '/home'); // Navigate to Home screen
        break;
      case "Profile":
        Navigator.pushNamed(context, '/profile'); // Navigate to Profile screen
        break;
      case "Settings":
        Navigator.pushNamed(
            context, '/settings'); // Navigate to Settings screen
        break;
      case "Logout":
        // Handle logout here
        break;
      default:
        break;
    }
  }
}
