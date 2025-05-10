import 'package:egyptifi/feedback_screen.dart';
import 'package:egyptifi/main_app_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperienceDetailScreen extends StatelessWidget {
  const ExperienceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Egyptify'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/Frame 1.png",
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore the citadel of Salah of Al-Din Al-Ayoubi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Discover the Heart of Egypt Through Culture, Crafts, and Authentic Flavors',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text('4.5 (268)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '1899 E.P. for Person',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookingDetailsScreen(),
                        ),
                      );
                    },
                    child: const Text('Book Now'),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'About this experience',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Detailed description of the experience would go here. '
                        'This would include all the information about what the '
                        'guest will do, see, and experience during the tour.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Egyptify - Booking'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Alexandria Full-Day Trip From Cairo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text('S30 EFG / Adult > 2 adult > 1000 EFG'),
              const Text('300 EFG / Child > 1 Child > 300 EFG'),
              const SizedBox(height: 10),
              const Text('Car = 400 EFG   &   VSeg = 100 EFG'),
              const Divider(height: 30),
              const Text(
                'Total',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                '1899 EPG',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Text('Payment Method'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Radio(
                    activeColor: Color(0xff46889A),
                      value: 0, groupValue: 0, onChanged: (value) {}),
                  const Text('Credit Card'),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Card Number'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '1234',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'CGV',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Expiration',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff46889A),
                ),
                onPressed: () {
                  // Handle payment
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookingConfirmationScreen(),
                    ),
                  );
                },
                child: const Text('Pay Now',
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 20),
              const Text(
                'Booking Confirmed!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Explore the citadel of Salah of Al-Din Al-Ayoubi',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                '1995 E.P. for Person',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainAppScreen(),
                    ),
                  );
                },
                child: const Text('Back to Home'),
              ),
              // داخل الـ build method بعد زر Done
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedbackScreen(
                        bookingId: 'unique_booking_id_here',
                      ),
                    ),
                  );
                },
                child: const Text('Rate Your Experience'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String imagePath;
  final String status;
  final Color statusColor;
  final String title;
  final String price;
  final String? subtitle;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onButtonPressed;

  const BookingCard({
    super.key,
    required this.imagePath,
    required this.status,
    required this.statusColor,
    required this.title,
    required this.price,
    this.subtitle,
    required this.buttonText,
    required this.buttonColor,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: onButtonPressed,
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 220,
              child: BookingCard(
                imagePath: 'assets/images/Frame 96.png',
                status: 'Done',
                statusColor: const Color(0xFF7ACFC6),
                title: 'Explore the citadel of Salah of Al-Din Al-Ayoubi',
                price: '1899 E.P. for Person',
                buttonText: 'Rate',
                buttonColor: const Color(0xFF7ACFC6),
                onButtonPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FeedbackScreen(bookingId: '32432423',);
                  },));
                  // Handle Rate
                },
              ),
            ),
            SizedBox(
              width: 220,
              child: BookingCard(

                imagePath: 'assets/images/Frame 96.png',
                status: 'In progress',
                statusColor: const Color(0xFF46889A),
                title: 'Explore the citadel of Salah of Al-Din Al-Ayoubi',
                price: '1899 E.P. for Person',
                subtitle: 'Free Cancelation until 6:00 PM',
                buttonText: 'Cancel',
                buttonColor: Colors.redAccent,
                onButtonPressed: () {
                  // Handle Cancel
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
