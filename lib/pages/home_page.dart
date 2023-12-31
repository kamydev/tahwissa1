import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
// import 'package:travel_app/widgets/custom_icon_button.dart';
// import 'package:travel_app/widgets/location_card.dart';
import 'package:travel_app/widgets/nearby_places.dart';
import 'package:travel_app/widgets/recommended_places.dart';
import 'package:travel_app/widgets/tourist_places.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade500,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade400,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            Image.asset(
              'assets/map.png',
              width: 80,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "TAHWISSSA",
                  style: TextStyle(
                      fontFamily: 'Cinzel',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
                Text(
                  " Discover Algeria",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
        actions: [
          Visibility(
            visible: !_isSearchVisible,
            child: IconButton(
              icon: const Icon(Ionicons.search_outline),
              onPressed: () {
                setState(() => _isSearchVisible = true);
              },
            ),
          ),
          Visibility(
            visible: _isSearchVisible,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _isSearchVisible = false;
                    _searchController.clear();
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 12),
            child: IconButton(
              icon: const Icon(Ionicons.notifications_outline),
              onPressed: () {
                // Add your notification button logic here
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_isSearchVisible)
            Padding(
              padding: const EdgeInsets.all(14),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Ionicons.search_outline),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          Expanded(
            // backgroundColor : Colors.blueGrey.shade300,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(14),
              children: [
                // LOCATION CARD
                // const LocationCard(),
                // const SizedBox(height: 15),
                const TouristPlaces(),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Nearby",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ))
                  ],
                ),
                const SizedBox(height: 10),
                const RecommendedPlaces(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommendation",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text("View All",
                            style: TextStyle(
                              color: Colors.black54,
                            )))
                  ],
                ),
                const SizedBox(height: 10),
                const NearbyPlaces(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey.shade400,
        selectedItemColor: Colors.white,
        // unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.bookmark_outline),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
          )
        ],
      ),
    );
  }
}
