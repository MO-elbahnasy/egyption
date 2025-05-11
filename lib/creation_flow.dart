import 'package:flutter/material.dart';

class CreateExperienceFlow extends StatefulWidget {
  const CreateExperienceFlow({super.key});

  @override
  _CreateExperienceFlowState createState() => _CreateExperienceFlowState();
}

class _CreateExperienceFlowState extends State<CreateExperienceFlow> {
  int _currentStep = 0;
  final List<String> _selectedLanguages = [];
  final List<String> _selectedFocuses = [];
  final List<String> _selectedFoods = [];
  final List<String> _selectedTransportFeatures = [];
  bool _parentsCanBringKids = false;
  bool _museumEntryTicketSelected = false;
  bool _hashtagsCreated = false;
  bool _photosAdded = false;

  @override
  void initState() {
    super.initState();
    // يمكنك تفعيل هذه السطر لاختيار كل العناصر تلقائياً عند البدء
    // _selectAllAutomatically();
  }

  void _selectAllAutomatically() {
    setState(() {
      // اللغات
      _selectedLanguages.addAll(['English', 'French', 'German', 'Italian']);

      // الاهتمامات
      _selectedFocuses.addAll(['Culture', 'History', 'Food', 'Adventure']);

      // الطعام والشراب
      _selectedFoods.addAll([
        'Snacks', 'Appetizers', 'Breakfast', 'Launch',
        'Dinner', 'Deserts', 'Tea', 'Water', 'Coffee', 'Soft drinks', 'other'
      ]);

      // وسائل المواصلات
      _selectedTransportFeatures.addAll([
        'Private Transport (Car, Motorcycling, etc)',
        'Flying (Hotair Balloon, Parachut, etc)',
        'Boating (Motorized boat, Felluca, etc)'
      ]);

      // الخيارات الأخرى
      _parentsCanBringKids = true;
      _museumEntryTicketSelected = true;
      _hashtagsCreated = true;
      _photosAdded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Experience'),
      ),
    body: Theme(
    data: Theme.of(context).copyWith(
    colorScheme: const ColorScheme.light(
    primary: Color(0xFF46889A),
    ),
    ),
      child: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 6) {
            setState(() {
              _currentStep += 1;
            });
          } else {
            Navigator.pop(context);
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
            title: const Text('Basic Details'),
            content: _buildBasicDetailsStep(),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Description'),
            content: _buildDescriptionStep(),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Profile Photo'),
            content: _buildProfilePhotoStep(),
            isActive: _currentStep >= 2,
          ),
          Step(
            title: const Text('What You Provide'),
            content: _buildWhatYouProvideStep(),
            isActive: _currentStep >= 3,
          ),
          Step(
            title: const Text('Experience Name'),
            content: _buildExperienceNameStep(),
            isActive: _currentStep >= 4,
          ),
          Step(
            title: const Text('Photos'),
            content: _buildPhotosStep(),
            isActive: _currentStep >= 5,
          ),
          Step(
            title: const Text('Pricing'),
            content: _buildPricingStep(),
            isActive: _currentStep >= 6,
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildBasicDetailsStep() {
    final languages = ['English', 'French', 'German', 'Italian'];
    final focuses = ['Culture', 'History', 'Food', 'Adventure'];

    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Where Will Your Trip Be?',
            hintText: 'City',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.location_on),
            const SizedBox(width: 10),
            const Text('Use my current location'),
          ],
        ),
        const SizedBox(height: 20),
        const Text('Which languages will you use in your experience?'),
        Wrap(
          spacing: 8,
          children: languages.map((lang) {
            final isSelected = _selectedLanguages.contains(lang);
            return FilterChip(
              label: Text(lang),
              selected: isSelected,
              selectedColor: Colors.blue.shade100,
              checkmarkColor: Colors.blue,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedLanguages.add(lang);
                  } else {
                    _selectedLanguages.remove(lang);
                  }
                });
              },
            );
          }).toList(),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              if (_selectedLanguages.length == languages.length) {
                _selectedLanguages.clear();
              } else {
                _selectedLanguages.clear();
                _selectedLanguages.addAll(languages);
              }
            });
          },
          child: Text(_selectedLanguages.length == languages.length
              ? 'Deselect All'
              : 'Select All'),
        ),
        const SizedBox(height: 20),
        const Text('What your Experience focus on?'),
        Wrap(
          spacing: 8,
          children: focuses.map((focus) {
            final isSelected = _selectedFocuses.contains(focus);
            return FilterChip(
              label: Text(focus),
              selected: isSelected,
              selectedColor: Colors.green.shade100,
              checkmarkColor: Colors.green,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedFocuses.add(focus);
                  } else {
                    _selectedFocuses.remove(focus);
                  }
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _hashtagsCreated = !_hashtagsCreated;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _hashtagsCreated ? Colors.green.shade100 : null,
          ),
          child: Text(
            'Create Your Hashtags',
            style: TextStyle(
              color: _hashtagsCreated ? Colors.green : null,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '1/7',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildDescriptionStep() {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'What will you and your guests do?',
            border: OutlineInputBorder(),
            hintText:
            'Describe what makes your experience special something that guests wouldn\'t do on their own',
          ),
          maxLines: 4,
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Tell Tourists the story of what they will do during your experience',
            border: OutlineInputBorder(),
            hintText: 'Required more than 150 words',
          ),
          maxLines: 6,
        ),
        const SizedBox(height: 20),
        const Text('What is the average duration of your experience?'),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: '2 hours',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        Text(
          'Remaining ${7 - _currentStep} Steps',
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
        const Text(
          'You Looks unique for this experience can you tell the tourists How?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Tell us story appears your passion and knowladgement',
            hintText: 'Required more than 100 words',
            border: OutlineInputBorder(),
          ),
          maxLines: 6,
        ),
        const SizedBox(height: 20),
        Text(
          'Remaining ${7 - _currentStep} Steps',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildWhatYouProvideStep() {
    final transportFeatures = [
      'Private Transport (Car, Motorcycling, etc)',
      'Flying (Hotair Balloon, Parachut, etc)',
      'Boating (Motorized boat, Felluca, etc)'
    ];

    final foods = [
      'Snacks', 'Appetizers', 'Breakfast', 'Launch', 'Dinner', 'Deserts',
      'Tea', 'Water', 'Coffee', 'Soft drinks', 'other'
    ];

    return Column(
      children: [
        const Text(
          'Does your Trip involve one of the following features?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ...transportFeatures.map((feature) {
          final isSelected = _selectedTransportFeatures.contains(feature);
          return CheckboxListTile(
            title: Text(feature),
            value: isSelected,
            onChanged: (value) {
              setState(() {
                if (value == true) {
                  _selectedTransportFeatures.add(feature);
                } else {
                  _selectedTransportFeatures.remove(feature);
                }
              });
            },
          );
        }),
        const SizedBox(height: 20),
        const Text(
          'FOOD & DRINKS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text('Food that you will provides'),
        Wrap(
          spacing: 8,
          children: foods.map((item) {
            final isSelected = _selectedFoods.contains(item);
            return FilterChip(
              label: Text(item),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedFoods.add(item);
                  } else {
                    _selectedFoods.remove(item);
                  }
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        const Text('Write the tickets types that you will provide in the experience (Optional)'),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _museumEntryTicketSelected = !_museumEntryTicketSelected;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _museumEntryTicketSelected ? Colors.blue.shade100 : null,
          ),
          child: Text(
            'Museum Entry Ticket',
            style: TextStyle(
              color: _museumEntryTicketSelected ? Colors.blue : null,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '1/4',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          'Remaining ${7 - _currentStep} Steps',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildExperienceNameStep() {
    return Column(
      children: [
        const Text(
          'Give your experience a name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Create your experience subtitle try to make it appears your experience story in brief.',
        ),
        const SizedBox(height: 10),
        const Text(
          'Discover the Heart of Egypt Through Culture, Crafts, and Authentic Flavors',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'YOUR EXPERIENCE TITLE',
            hintText: 'Effective names are clear, concise, and engaging. Keep them short, use lowercase except for the first letter, and aim for maximum clarity.',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        const Text('0/50 letters'),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Engaging with Egyptian life & khan El khalli tour',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        const Text('0/150 letters'),
        const SizedBox(height: 20),
        Text(
          'Remaining ${7 - _currentStep} Steps',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPhotosStep() {
    return Column(
      children: [
        const Text(
          'Add Some Photos of your Experience',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Your photos must have\n'
              'A variety of details and angles, including photos of people in action\n'
              'Candid moments that accurately illustrate the experience\n'
              'Good image quality—no heavy filters, distortions, overlaid text, or watermarks',
        ),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(6, (index) {
            return Container(
              margin: const EdgeInsets.all(4),
              color: _photosAdded ? Colors.blue.shade100 : Colors.grey[200],
              child: Icon(
                Icons.add_a_photo,
                color: _photosAdded ? Colors.blue : null,
              ),
            );
          }),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _photosAdded = !_photosAdded;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _photosAdded ? Colors.blue.shade100 : null,
          ),
          child: Text(
            'Add Photos',
            style: TextStyle(
              color: _photosAdded ? Colors.blue : null,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Remaining ${7 - _currentStep} Steps',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPricingStep() {
    return Column(
      children: [
        const Text(
          'Let\'s Describe Experience Price',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text(
          'Public groups Size',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'You can host a public group for up to 10 guests. A Guests who book may or may not know each other.',
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: '6 Person',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        const Text(
          'Private groups',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'For in-person experiences, you can host a private group for up to 30 guests.',
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: '2 Person',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        const Text(
          'Minimum age',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'You can host a public group for up to 10 guests. A Guests who book may or may not know each other.',
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: '7 years old',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        CheckboxListTile(
          title: const Text('Parents can bring kids under 2 years'),
          value: _parentsCanBringKids,
          onChanged: (value) {
            setState(() {
              _parentsCanBringKids = value ?? false;
            });
          },
        ),
        const SizedBox(height: 20),
        const Text(
          'What time would you typically start your experience?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'You\'ll schedule exact dates and times that you\'re available to host before you go live.',
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: '00:00',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 20),
        const Text(
          'Cutoff time for First guest',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'We recommend setting your cutoff time close to your start time so more guests can book.',
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: '1 week before start time',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Remaining ${7 - _currentStep} Steps',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}