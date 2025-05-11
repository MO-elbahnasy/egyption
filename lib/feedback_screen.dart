// screens/booking/feedback_screen.dart

import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  final String bookingId;

  const FeedbackScreen({Key? key, required this.bookingId}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _experienceRating = 4;
  int _guideRating = 4;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRatingSection(
              title: 'Guide Rate',
              rating: _guideRating,
              onRatingChanged: (value) {
                setState(() => _guideRating = value);
              },
            ),

            const SizedBox(height: 30),

            _buildRatingSection(
              title: 'Experience Rate',
              rating: _experienceRating,
              onRatingChanged: (value) {
                setState(() => _experienceRating = value);
              },
            ),

            const SizedBox(height: 40),

            const Text(
              'Additional feedback',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'If you have any additional feedback, please type it in here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _submitFeedback,
                child: const Text('Submit Feedback'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSection({
    required String title,
    required int rating,
    required Function(int) onRatingChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.white10,
                size: 30,
              ),
              onPressed: () => onRatingChanged(index + 1),
            );
          }),
        ),
      ],
    );
  }

  void _submitFeedback() {

    final feedbackData = {
      'booking_id': widget.bookingId,
      'guide_rating': _guideRating,
      'experience_rating': _experienceRating,
      'comments': _feedbackController.text,
    };

    print(feedbackData);


    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thank you for your feedback!')),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}