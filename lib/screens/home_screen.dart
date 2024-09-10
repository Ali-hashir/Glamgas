import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Function to open the website
  Future<void> _openWebsite() async {
    const url = 'https://glamgas.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appProvider = Provider.of<AppProvider>(context); // Access app-wide state

    return Scaffold(
      body: Stack(
        children: [
          // Background Image with reduced opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Reduced opacity for the background image
              child: Image.asset(
                'assets/pngegg.png', // Ensure the image is placed in the assets folder
                fit: BoxFit.cover, // Make the image cover the whole screen
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Animated logo appearance
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    'assets/Logo.jfif',
                    height: screenHeight * 0.3, // 30% of screen height
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Responsive spacing

                // Buy Appliances Button
                SizedBox(
                  width: screenWidth * 0.8, // 80% of screen width
                  child: ElevatedButton(
                    onPressed: () {
                      _openWebsite();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      elevation: 5, // Add shadow for better UI
                    ),
                    child: const Text('Buy Appliances', style: TextStyle(fontSize: 18)),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03), // Spacing between buttons

                // Register Complaint Button
                SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registerComplaint');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      elevation: 5,
                    ),
                    child: const Text('Register Complaint', style: TextStyle(fontSize: 18)),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Register Product Button
                SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registerProduct');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      elevation: 5,
                    ),
                    child: const Text('Register Product', style: TextStyle(fontSize: 18)),
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
