import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notary Banner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NotaryBanner(),
        ),
      ),
    );
  }
}

class NotaryBanner extends StatelessWidget {
  const NotaryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    // Using LayoutBuilder to make the banner responsive while maintaining aspect ratio.
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define a base width and calculate height based on the 900x100 ratio
        double width = constraints.maxWidth;
        double height = width * (100 / 900);

        // Set max height for very narrow screens to keep it reasonable
        if (width < 600) {
            height = width * (150/900);
        }

        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0D47A1), Color(0xFF1976D2)], // Deep blue gradient
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Background Icons for legal/professional theme
              _buildIcon(Icons.gavel, 0.1, 0.2, 0.05),
              _buildIcon(Icons.verified_user, 0.8, 0.8, 0.05),
              _buildIcon(Icons.account_balance, 0.5, 0.5, 0.04),

              // Main Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left side: Icon and Text
                    Row(
                      children: [
                        // Icon representing a sealed document
                        const Icon(Icons.description, color: Colors.white70, size: 40),
                        SizedBox(width: width * 0.02),
                        // Highlight Text
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'sans-serif',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Certified Notary Services\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  height: 1.2,
                                ),
                              ),
                              TextSpan(
                                text: 'Near You',
                                style: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Right side: CTA Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Get Documents Notarized'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper widget to build the faint background icons
  Widget _buildIcon(IconData icon, double top, double left, double opacity) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment(left * 2 - 1, top * 2 - 1),
        child: Icon(
          icon,
          color: Colors.white.withOpacity(opacity),
          size: 50,
        ),
      ),
    );
  }
}
