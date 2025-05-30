import 'package:egyptifi/booking_screen.dart';
import 'package:egyptifi/creation_flow.dart';
import 'package:egyptifi/profile_screen.dart';
import 'package:egyptifi/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ExploreScreen(),
   const BookingScreen(),
   const FavoritesScreen(),
   const ProfileScreen(),
    const CreateExperienceFlow(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Egyptify'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
               MaterialPageRoute(builder: (context) {
                 return SearchScreen();
               },)
              );
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            backgroundColor: Color(0xff46889A),
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            backgroundColor: const Color(0xff46889A),
            icon: SvgPicture.asset('assets/icons/booking.svg',

            ),
            label: 'Bookings',
          ),
          const BottomNavigationBarItem(
            backgroundColor: Color(0xff46889A),
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),


          const BottomNavigationBarItem(
            backgroundColor: Color(0xff46889A),

            icon: Icon(Icons.person),
            label: 'Profile',
          ),

          const BottomNavigationBarItem(
            backgroundColor: Color(0xff46889A),
            icon: Icon(Icons.explicit),
            label: 'Experiences',
          ),

        ],
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Popular',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PopularDestinationCard(
                  title: 'Giza',
                  subtitle: 'The Pyramids and the Sphinx, The .....',
                ),
                PopularDestinationCard(
                  title: 'Cairo',
                  subtitle: 'The Egyptian Museum and the .....',
                ),
                PopularDestinationCard(
                  title: 'Alexandria',
                  subtitle: 'Bibliotheca Alexandrina, Qa....',
                ),
                PopularDestinationCard(
                  title: 'Luxor',
                  subtitle: 'Karnak and Luxor Temples...',
                ),
                PopularDestinationCard(
                  title: 'Aswan',
                  subtitle: 'Philae Temple, Botanical Island...',
                ),
                PopularDestinationCard(
                  title: 'Red Sea',
                  subtitle: 'Hurghada and Safaga, Island...',
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'No. people',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Language',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Featured Experiences',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return const ExperienceCard(
                title: 'Explore the citadel of Salah of Al-Din Al-Ayoubi',
                subtitle:
                'Discover the Heart of Egypt Through Culture, Crafts, and Authentic Flavors',
                price: '1899 E.P. for Person',
                rating: '4.5 (268)',
              );
            },
          ),
        ],
      ),
    );
  }
}

class PopularDestinationCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const PopularDestinationCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String rating;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/Frame 96.png',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const Icon(Icons.favorite, color: Colors.red, size: 16),
                        Text(rating),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExperienceDetailScreen(),
                      ),
                    );
                  },
                  child: const Text('Learn More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example favorite experiences data
    final favorites = [
      const ExperienceCard(
        title: 'Explore the citadel of Salah of Al-Din Al-Ayoubi',
        subtitle: 'Discover the Heart of Egypt Through Culture, Crafts, and Authentic Flavors',
        price: '1899 E.P. for Person',
        rating: '4.5 (268)',
      ),
      const ExperienceCard(
        title: 'Nile Dinner Cruise',
        subtitle: 'Enjoy dinner and live entertainment on the Nile',
        price: '1200 E.P. for Person',
        rating: '4.7 (154)',
      ),
      const ExperienceCard(
        title: 'Giza Pyramids Tour',
        subtitle: 'Guided tour of the Pyramids and Sphinx',
        price: '2100 E.P. for Person',
        rating: '4.8 (320)',
      ),
      const ExperienceCard(
        title: 'Khan El Khalili Bazaar',
        subtitle: 'Shopping and local crafts in Cairo',
        price: '500 E.P. for Person',
        rating: '4.3 (98)',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: favorites.length,
      itemBuilder: (context, index) => favorites[index],
    );
  }
}
class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Experiences',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
