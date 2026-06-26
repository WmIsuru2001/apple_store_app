import 'package:apple/components/buttons/custom_button.dart';
import 'package:apple/screens/auth_screen/widgets/custom_text_field.dart';
import 'package:apple/screens/home_page/home_page.dart';
import 'package:apple/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String type = 'signin';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    type == 'signup'
                        ? "Create Account"
                        : type == 'signin'
                            ? "Sign In"
                            : "Forgot Password",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    type == 'signup'
                        ? "Sign up with your account"
                        : type == 'signin'
                            ? "Sign in to your account"
                            : "Enter your email to reset your password",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Email
                  const CustomTextField(
                    hintText: "Email",
                    prefixIcon: Icons.email_outlined,
                  ),

                  /// Password
                  if (type != 'forgot') ...[
                    const SizedBox(height: 15),
                    const CustomTextField(
                      hintText: "Password",
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                    ),
                  ],

                  /// Confirm Password
                  if (type == 'signup') ...[
                    const SizedBox(height: 15),
                    const CustomTextField(
                      hintText: "Confirm Password",
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                    ),
                  ],

                  // Forgot Password Button
                  if (type == 'signin')
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            type = 'forgot';
                          });
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),

                  /// Main Button
                  CustomButton(
                    size: size,
                    text: type == 'signup'
                        ? "Sign Up"
                        : type == 'signin'
                            ? "Sign In"
                            : "Reset Password",
                    ontap: () {
                      CustomNavigator.push(context, const HomePage());
                    },
                  ),

                  // Hide this section on Forgot Password
                  if (type != 'forgot') ...[
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "or continue with",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            size: size,
                            text: "Google",
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                              size: 18,
                            ),
                            bgcolor: Colors.white,
                            fontColor: Colors.black,
                            borderColor: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomButton(
                            size: size,
                            text: "Apple",
                            icon: const FaIcon(
                              FontAwesomeIcons.apple,
                              color: Colors.black,
                              size: 20,
                            ),
                            bgcolor: Colors.white,
                            fontColor: Colors.black,
                            borderColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: Text(
                        type == 'signin'
                            ? "Don't have an account?"
                            : "Already have an account?",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],

                  // Bottom Button
                  CustomButton(
                    size: size,
                    text: type == 'signup'
                        ? "Sign In"
                        : type == 'signin'
                            ? "Sign Up"
                            : "Cancel",
                    bgcolor: Colors.white,
                    fontColor: Colors.black,
                    borderColor: Colors.black,
                    ontap: () {
                      setState(() {
                        if (type == 'signin') {
                          type = 'signup';
                        } else if (type == 'signup') {
                          type = 'signin';
                        } else {
                          // Cancel from Forgot Password
                          type = 'signin';
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
