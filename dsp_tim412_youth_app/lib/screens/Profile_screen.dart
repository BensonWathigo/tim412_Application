import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Profile Picture
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  'lib/assets/images/profile.jpg',
                ),
              ),
              const SizedBox(height: 16),

              // User Name
              const Text(
                'Benson Wathigo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Email
              Text(
                'bensonwathigo21@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),

              // Divider
              const Divider(thickness: 1),

              // Profile Information
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('Full Name'),
                subtitle: Text('Benson Wathigo'),
              ),
              const ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('bensonwathigo21.com'),
              ),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                subtitle: Text('+254 723 552 044'),
              ),
              const ListTile(
                leading: Icon(Icons.location_city),
                title: Text('Address'),
                subtitle: Text('P.O.Box 10143 - 00400'),
              ),

              const SizedBox(height: 24),

              // Log Out Button
              ElevatedButton.icon(
                onPressed: () {
                  // log out wil be here
                },
                icon: const Icon(Icons.logout),
                label: const Text('Log Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
