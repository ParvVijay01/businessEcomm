import 'package:business_ecomm/features/home/presentation/components/drawer.dart';
import 'package:business_ecomm/features/home/presentation/components/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

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
              fillColor: Color(0xFFF5F5F5),
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
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 5),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCard(
                    logo: 'assets/images/1.jpg',
                    subtitle: 'Hello',
                    title: 'JeeVijay IT Solutions',
                    desc: 'Textile',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyCard(
                    logo: 'assets/images/2.jpg',
                    subtitle: 'Hello',
                    title: 'JeeVijay IT',
                    desc: 'Textile',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyCard(
                    logo: 'assets/images/2.jpg',
                    subtitle: 'Hello',
                    title: 'JeeVijay IT',
                    desc: 'Textile',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyCard(
                    logo: 'assets/images/2.jpg',
                    subtitle: 'Hello',
                    title: 'JeeVijay IT',
                    desc: 'Textile',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
