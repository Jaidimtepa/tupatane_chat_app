import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("User Profile"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Image
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            const SizedBox(height: 20),

            // Username
            const Text(
              "Catherine Sinkala",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),
            const Text(
              "@cattie",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Info Cards
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Email"),
                subtitle: const Text("catherine@example.com"),
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Phone"),
                subtitle: const Text("+255 712 345 678"),
              ),
            ),

            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text("Location"),
                subtitle: const Text("Dar es Salaam, Tanzania"),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Edit Profile"),
            )
          ],
        ),
      ),
    );
  }
}