import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DateTime _selectedDate = DateTime(2002, 05, 20);
  String _phoneNumber = '+84 364 655 822';
  String _email = 'nguyenduyhung.20052002@gmail.com';
  String _gender = 'Male';
  String _city = 'Ha Noi City';
  String _language = 'English';
  bool _notificationsEnabled = true;

  final List<String> _cities = [
    'Ho Chi Minh City',
    'Ha Noi City',
    'Da Nang City',
    'Can Tho City'
  ];
  final List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Handle edit button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://scontent.fhan5-11.fna.fbcdn.net/v/t39.30808-1/251583166_413705473545351_4650509112044711822_n.jpg?stp=dst-jpg_s200x200&_nc_cat=103&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeGin-sqYI0Qe-vZMikFO6JYY-QNsMggn39j5A2wyCCffznbOzH_uzboh26-9KajiXaQQwMUfGRYUMNeYDFAX0TN&_nc_ohc=zpB04HhqDFoQ7kNvgG_skUo&_nc_ht=scontent.fhan5-11.fna&oh=00_AYCtiLWwOgipUrcCWCPGKClvgwRvevuQokbujQv95Hej7A&oe=66EE0209'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Nguyễn Duy Hưng',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildInfoSection(),
            _buildSettingsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildInfoTile(
              'Date of birth', _formatDate(_selectedDate), Icons.calendar_today,
              onTap: _selectDate),
          _buildInfoTile('Phone number', _phoneNumber, Icons.phone,
              onTap: () => _showEditDialog('Phone number', _phoneNumber)),
          _buildInfoTile('Email', _email, Icons.email,
              onTap: () => _showEditDialog('Email', _email, isEmail: true)),
          _buildInfoTile('Gender', _gender, Icons.person, onTap: _selectGender),
          _buildInfoTile('City', _city, Icons.location_city,
              onTap: _selectCity),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildLanguageToggle(),
          _buildNotificationToggle(),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, IconData icon,
      {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Text(value),
      onTap: onTap,
    );
  }

  Widget _buildLanguageToggle() {
    return ListTile(
      leading: const Icon(Icons.language),
      title: const Text('Language'),
      trailing: Text(_language),
      onTap: _selectLanguage,
    );
  }

  void _selectLanguage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ['English', 'Vietnamese'].map((String language) {
              return ListTile(
                title: Text(language),
                onTap: () {
                  setState(() {
                    _language = language;
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildNotificationToggle() {
    return ListTile(
      leading: const Icon(Icons.notifications),
      title: const Text('Receive notifications'),
      trailing: Switch(
        value: _notificationsEnabled,
        onChanged: (bool value) {
          setState(() {
            _notificationsEnabled = value;
          });
        },
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _selectGender() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Gender'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _genders.map((String gender) {
              return ListTile(
                title: Text(gender),
                onTap: () {
                  setState(() {
                    _gender = gender;
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _selectCity() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select City'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _cities.map((String city) {
              return ListTile(
                title: Text(city),
                onTap: () {
                  setState(() {
                    _city = city;
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showEditDialog(String title, String initialValue,
      {bool isEmail = false}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newValue = initialValue;
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            onChanged: (value) {
              newValue = value;
            },
            decoration: InputDecoration(hintText: 'Enter new $title'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (isEmail && !_isValidEmail(newValue)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter a valid email address')),
                  );
                } else {
                  setState(() {
                    if (title == 'Phone number') {
                      _phoneNumber = newValue;
                    } else if (title == 'Email') {
                      _email = newValue;
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
