import 'package:egyptifi/main_app_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BecomeGuideFlow extends StatefulWidget {
  const BecomeGuideFlow({super.key});

  @override
  _BecomeGuideFlowState createState() => _BecomeGuideFlowState();
}

class _BecomeGuideFlowState extends State<BecomeGuideFlow> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Egyptify - Become a Guide'),
      ),
      body: Theme(
    data: Theme.of(context).copyWith(
    colorScheme: ColorScheme.light(
    primary: Color(0xFF46889A), )),// <-- Your custom color here
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 5) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              // Complete the flow
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GuideVerificationScreen(),
                ),
              );
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            } else {
              Navigator.pop(context);
            }
          },
          steps: [
            Step(
              title: const Text('Personal Information'),
              content: _buildPersonalInfoStep(),
              isActive: _currentStep >= 0,
            ),
            Step(
              title: const Text('Profile Photo'),
              content: _buildProfilePhotoStep(),
              isActive: _currentStep >= 1,
            ),
            Step(
              title: const Text('Languages'),
              content: _buildLanguagesStep(),
              isActive: _currentStep >= 2,
            ),
            Step(
              title: const Text('Contact Information'),
              content: _buildContactInfoStep(),
              isActive: _currentStep >= 3,
            ),
            Step(
              title: const Text('Financial Information'),
              content: _buildFinancialInfoStep(),
              isActive: _currentStep >= 4,
            ),
            Step(
              title: const Text('Create Password'),
              content: _buildCreatePasswordStep(),
              isActive: _currentStep >= 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoStep() {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'First Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Enter Your Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'ID Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Where do you live?',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Only ${6 - _currentStep} Steps Away from Being a Tourist Buddy!',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildProfilePhotoStep() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, size: 50),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle photo upload
          },
          child: const Text('Upload your profile photo'),
        ),
        const SizedBox(height: 20),
        Text(
          'Remaining ${6 - _currentStep} Steps',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildLanguagesStep() {
    final List<String> languages = [
      'English', 'French', 'German', 'Chinese', 'Hindi', 'Japanese',
      'Italian', 'Korean', 'Indonesian', 'Spanish', 'Bengali', 'Portuguese',
      'Russian', 'Urdu', 'Turkish', 'Farsi'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '# Choose 5 languages at most',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: languages.map((language) {
            return FilterChip(
              label: Text(language),
              onSelected: (bool selected) {
                // Handle language selection
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        Text(
          'Remaining ${6 - _currentStep} Steps',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildContactInfoStep() {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: '+20 Your Mobile Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Your Facebook URL (Optional)',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Your Instagram URL (Optional)',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: 20),
        Text(
          'Remaining ${6 - _currentStep} Steps',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildFinancialInfoStep() {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Full Name registered in Bank',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Your Bank Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Bank Account Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'International Bank Account Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        Text(
          'Remaining ${6 - _currentStep} Steps',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCreatePasswordStep() {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Text(
          'Remaining ${6 - _currentStep} Steps',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class GuideVerificationScreen extends StatelessWidget {
  const GuideVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '# You\'re so close!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'After verifying your account,\n'
                    'you can add your first experience\n'
                    'within 24h. We\'ll email you to\n'
                    'schedule your language test.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainAppScreen(),
                    ),
                  );
                },
                child: const Text('GO HOME'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}