import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    const double figmaWidth = 375;
    const double figmaHeight = 812;

    return Scaffold(
      // The background color is primarily black, as indicated by the gradient stops and overall theme.
      backgroundColor: const Color.fromRGBO(5, 5, 5, 1.0),
      body: Stack(
        children: [
          // Background Image (id: I156:95;417:719)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * (536 / figmaHeight), // Original height: 536px
            child: Image.asset(
              'assets/images/I156_95_417_719.png',
              fit: BoxFit.cover,
            ),
          ),

          // Gradient Overlay (id: 156:97 "Shadow Container")
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * (360 / figmaHeight), // Original height: 360px
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(5, 5, 5, 0.0), // Figma r: 0.0196..., g: 0.0196..., b: 0.0196..., a: 0
                    Color.fromRGBO(5, 5, 5, 1.0), // Figma r: 0.0196..., g: 0.0196..., b: 0.0196..., a: 1
                  ],
                  stops: [0.0, 0.23670603334903717], // Figma gradient stops
                ),
              ),
            ),
          ),

          // Main Content (Title, Description, Button)
          Positioned(
            // The content position is determined by placing the button at a specific distance from the bottom.
            // Button absoluteBoundingBox.y (702) + height (56) = 758. Screen height 812. So, 812 - 758 = 54px from bottom.
            // This position ensures the entire content block (text + button) is correctly placed.
            bottom: screenHeight * (54 / figmaHeight),
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / figmaWidth)), // Original x=24 margin for content
              child: Column(
                mainAxisSize: MainAxisSize.min, // Wrap content height
                crossAxisAlignment: CrossAxisAlignment.center, // Align children centrally
                children: [
                  // Title Text (id: 156:101)
                  Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: screenWidth * (32 / figmaWidth), // Scale font size responsively
                      fontWeight: FontWeight.w600, // Sora-SemiBold
                      color: Colors.white,
                      height: 1.5, // Line height 48px / font size 32px = 1.5
                      letterSpacing: 0.16,
                    ),
                  ),
                  SizedBox(height: screenHeight * (8 / figmaHeight)), // Item spacing 8px between texts
                  // Description Text (id: 156:102)
                  Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: screenWidth * (14 / figmaWidth), // Scale font size responsively
                      fontWeight: FontWeight.w400, // Sora-Regular
                      color: const Color.fromRGBO(167, 167, 167, 1.0), // Figma r: 0.635, g: 0.635, b: 0.635, a: 1
                      height: 1.5, // Line height 21px / font size 14px = 1.5
                      letterSpacing: 0.14,
                    ),
                  ),
                  SizedBox(height: screenHeight * (32 / figmaHeight)), // Gap between text frame bottom (y=670) and button frame top (y=702) is 32px
                  // Get Started Button (id: 156:98)
                  SizedBox(
                    width: double.infinity, // Occupy full width within padding
                    height: screenHeight * (56 / figmaHeight), // Original height 56px
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the home screen using go_router
                        context.go('/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(198, 124, 78, 1.0), // Figma r: 0.776, g: 0.486, b: 0.305, a: 1
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // cornerRadius 16
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * (20 / figmaWidth), // paddingLeft/Right 20
                          vertical: screenHeight * (16 / figmaHeight), // paddingTop/Bottom 16
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.sora(
                          fontSize: screenWidth * (16 / figmaWidth), // Scale font size responsively
                          fontWeight: FontWeight.w600, // Sora-SemiBold
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Custom Status Bar (Top) (id: 156:104 "Iphone" variant "Time")
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * (44 / figmaHeight), // Original height 44px
            child: SafeArea(
              bottom: false, // Status bar is at the top, no bottom safe area needed
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / figmaWidth)), // Original horizontal padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41', // Original time text
                      style: GoogleFonts.sora(
                        fontSize: screenWidth * (15 / figmaWidth), // Adjusted to commonly seen status bar time size (was 12px in render bounds, but often larger visually)
                        fontWeight: FontWeight.w600, // Inferring SemiBold for status bar time
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        // Mobile Signal Icon (id: I156:104;417:339)
                        Icon(Icons.signal_cellular_alt, color: Colors.white, size: screenWidth * (17 / figmaWidth)),
                        SizedBox(width: screenWidth * (5 / figmaWidth)), // Small spacing between icons
                        // Wifi Icon (id: I156:104;417:335)
                        Icon(Icons.wifi, color: Colors.white, size: screenWidth * (17 / figmaWidth)),
                        SizedBox(width: screenWidth * (5 / figmaWidth)), // Small spacing between icons
                        // Battery Icon (id: I156:104;417:331)
                        Icon(Icons.battery_full_rounded, color: Colors.white, size: screenWidth * (20 / figmaWidth)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Home Indicator (Bottom) (id: 156:103 "Iphone" variant "Home Indicator")
          Positioned(
            // Calculated bottom position: absoluteBoundingBox.y (799) + height (5) = 804. Screen height 812. So, 812 - 804 = 8px from bottom.
            bottom: screenHeight * (8 / figmaHeight),
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: screenWidth * (134 / figmaWidth), // Original width 134px
                height: screenHeight * (5 / figmaHeight), // Original height 5px
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(36, 36, 36, 1.0), // Figma r: 0.141, g: 0.141, b: 0.141, a: 1
                  borderRadius: BorderRadius.circular(100), // cornerRadius 100 makes it a pill shape
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}