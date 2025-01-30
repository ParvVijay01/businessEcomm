import 'package:business_ecomm/features/home/presentation/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedPage = "Home"; // Default selected page
  final TextEditingController _searchController = TextEditingController();

  void _handleNavigation(String page) {
    setState(() {
      _selectedPage = page; // Update UI when drawer item is clicked
    });
    print("Navigating to: $page");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        title: SizedBox(
          height: 40,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: FaIcon(
                  FontAwesomeIcons.searchengin,
                  size: 30,
                ),
              ),
              hintText: "Search...",
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (query) {
              print("Searching: $query");
            },
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined))
        ],
      ),
      drawer: CustomDrawer(onItemTap: _handleNavigation),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 5),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            color: Theme.of(context).colorScheme.primary,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/1.jpg',
                      width: MediaQuery.of(context).size.width / 3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "JeeVijay IT",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            color: Theme.of(context).colorScheme.primary,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/1.jpg',
                      width: MediaQuery.of(context).size.width / 3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "JeeVijay IT",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
