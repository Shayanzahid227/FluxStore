import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  final String username = "John Doe";
  final String birthday = "January 1, 1990";
  final String bio = "This is a sample bio.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(' User Profile', style: GoogleFonts.sansita(fontSize: 25)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get(),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      // backgroundImage: AssetImage(
                      //     'assets/profile_pic.png'), // Replace with your image asset
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Username',
                    style: GoogleFonts.sansita(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    snapshot.data!.data()!['name'] ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Birthday',
                    style: GoogleFonts.sansita(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    birthday,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Bio',
                    style: GoogleFonts.sansita(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    bio,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle edit profile logic
                      },
                      child: Text('Edit Profile'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
